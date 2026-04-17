#!/usr/bin/env bash
# Claude Code Statusline
# 3-line display: session info, 5h usage, 7d usage
# Reference: https://zenn.dev/suthio/articles/f832922e18f994

set -euo pipefail

input=$(cat)

# ── Colors ──
GREEN="\033[38;2;151;201;195m"
YELLOW="\033[38;2;229;192;123m"
RED="\033[38;2;224;108;117m"
GRAY="\033[38;2;74;88;92m"
RESET="\033[0m"

color_for_pct() {
  local pct=$1
  if ((pct >= 80)); then
    printf '%s' "$RED"
  elif ((pct >= 50)); then
    printf '%s' "$YELLOW"
  else
    printf '%s' "$GREEN"
  fi
}

# ── Progress bar (10 segments) ──
progress_bar() {
  local pct=$1
  local filled=$((pct / 10))
  local empty=$((10 - filled))
  local color
  color=$(color_for_pct "$pct")
  local bar=""
  for ((i = 0; i < filled; i++)); do bar+="▰"; done
  for ((i = 0; i < empty; i++)); do bar+="▱"; done
  printf '%b%s%b' "$color" "$bar" "$RESET"
}

# ── Line 1: Session info ──
model=$(echo "$input" | jq -r '.model.display_name // ""')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
lines_added=$(echo "$input" | jq -r '.cost.total_lines_added // 0')
lines_removed=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // ""')

# Context percentage (integer)
ctx_int=0
if [ -n "$used_pct" ]; then
  printf -v ctx_int "%.0f" "$used_pct" 2>/dev/null || ctx_int="${used_pct%%.*}"
fi
ctx_color=$(color_for_pct "$ctx_int")

# Git branch
git_branch=""
if [ -n "$cwd" ] && git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
  git_branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
fi

sep="${GRAY} │ ${RESET}"

line1=" ${model}${sep}${ctx_color}◐ ${ctx_int}%${RESET}${sep}󱇧 +${lines_added}/-${lines_removed}"
if [ -n "$git_branch" ]; then
  line1+="${sep} ${git_branch}"
fi

# ── Rate limits from stdin JSON ──
# Format reset time for 5h window: "Resets 5pm (Asia/Tokyo)"
format_5h_reset() {
  local epoch_raw=$1
  [ -z "$epoch_raw" ] && return
  local epoch
  printf -v epoch "%.0f" "$epoch_raw" 2>/dev/null || epoch="${epoch_raw%%.*}"
  LC_ALL=en_US.UTF-8 TZ="Asia/Tokyo" date -r "$epoch" +"Resets %-l%p (Asia/Tokyo)" 2>/dev/null | sed 's/AM/am/;s/PM/pm/'
}

# Format reset time for 7d window: "Resets Mar 6 at 12pm (Asia/Tokyo)"
format_7d_reset() {
  local epoch_raw=$1
  [ -z "$epoch_raw" ] && return
  local epoch
  printf -v epoch "%.0f" "$epoch_raw" 2>/dev/null || epoch="${epoch_raw%%.*}"
  LC_ALL=en_US.UTF-8 TZ="Asia/Tokyo" date -r "$epoch" +"Resets %b %-d at %-l%p (Asia/Tokyo)" 2>/dev/null | sed 's/AM/am/;s/PM/pm/'
}

line2=""
line3=""

five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
seven_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
seven_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

if [ -n "$five_pct" ]; then
  printf -v five_int "%.0f" "$five_pct" 2>/dev/null || five_int="${five_pct%%.*}"
  five_color=$(color_for_pct "$five_int")
  five_bar=$(progress_bar "$five_int")
  five_reset_str=""
  if [ -n "$five_reset" ]; then
    five_reset_str=$(format_5h_reset "$five_reset")
  fi
  line2="${five_color}◷ 5h${RESET}  ${five_bar}  ${five_color}${five_int}%${RESET}"
  if [ -n "$five_reset_str" ]; then
    line2+="  ${GRAY}${five_reset_str}${RESET}"
  fi
fi

if [ -n "$seven_pct" ]; then
  printf -v seven_int "%.0f" "$seven_pct" 2>/dev/null || seven_int="${seven_pct%%.*}"
  seven_color=$(color_for_pct "$seven_int")
  seven_bar=$(progress_bar "$seven_int")
  seven_reset_str=""
  if [ -n "$seven_reset" ]; then
    seven_reset_str=$(format_7d_reset "$seven_reset")
  fi
  line3="${seven_color}󰃭 7d${RESET}  ${seven_bar}  ${seven_color}${seven_int}%${RESET}"
  if [ -n "$seven_reset_str" ]; then
    line3+="  ${GRAY}${seven_reset_str}${RESET}"
  fi
fi

# ── Output ──
printf '%b' "$line1"
if [ -n "$line2" ]; then
  printf '\n%b' "$line2"
fi
if [ -n "$line3" ]; then
  printf '\n%b' "$line3"
fi
