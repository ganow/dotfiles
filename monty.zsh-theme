#!/usr/bin/env zsh
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# put this code on $OH-MY-ZSH-DIR/custom
# the code is based on muse

setopt promptsubst

autoload -U add-zsh-hook

function _pyenv_prompt_info {
  [[ -n $(whence pyenv_prompt_info) ]] && \
    [[ "$(pyenv_prompt_info)" != "${PYENV_PROMPT_DEFAULT_VERSION}" ]] && \
    echo "${ZSH_THEME_PYENV_PROMPT_PREFIX}$(pyenv_prompt_info)${ZSH_THEME_PYENV_PROMPT_SUFFIX}"
}

PROMPT_SUCCESS_COLOR=$FG[117]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[077]
GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[117]
PYENV_PROMPT_INFO=$FG[117]

PROMPT='%{$FG[220]%}%M %{$PROMPT_SUCCESS_COLOR%}%(5~,%-2~/.../%2~,%~)%{$reset_color%}%{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PYENV_PROMPT_INFO%}$(_pyenv_prompt_info)%{$reset_color%}%{$PROMPT_PROMPT%}ᐅ%{$reset_color%} '

#RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=" git:<%{$FG[220]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%}>"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

ZSH_THEME_PYENV_PROMPT_PREFIX="pyenv:<%{$FG[220]%}"
ZSH_THEME_PYENV_PROMPT_SUFFIX="%{$PYENV_PROMPT_INFO%}> "

