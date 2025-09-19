# Load Sheldon plugins
if command -v sheldon >/dev/null 2>&1; then
  cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}
  sheldon_cache="$cache_dir/sheldon.zsh"
  sheldon_toml="$HOME/.config/sheldon/plugins.toml"
  # Make cache only when the cache file doesn't exist or the toml file is newer than the cache file
  if [[ ! -r "$sheldon_cache" || "$sheldon_toml" -nt "$sheldon_cache" ]]; then
    mkdir -p $cache_dir
    sheldon source > $sheldon_cache
  fi
  source "$sheldon_cache"
  unset cache_dir sheldon_cache sheldon_toml
fi

# History settings
export HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zsh_history}" # $XDG_STATE_HOMEにしても良いかも
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing non-existent history.

# [zsh-autosuggestions]
bindkey '^e' autosuggest-accept

[ -f $ZDOTDIR/.zshrc.alias ] && zsh-defer source $ZDOTDIR/.zshrc.alias
[ -f $ZDOTDIR/.zshrc.for-peco ] && zsh-defer source $ZDOTDIR/.zshrc.for-peco
[ -f $ZDOTDIR/.zshrc.profile ] && zsh-defer source $ZDOTDIR/.zshrc.profile
[ -f $ZDOTDIR/.zshrc.completions ] && zsh-defer source $ZDOTDIR/.zshrc.completions

if command -v starship >/dev/null 2>&1; then
  export STARSHIP_CONFIG=$ZDOTDIR/starship.toml
  eval "$(starship init zsh)"
fi
