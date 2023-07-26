# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/local/src/github.com/ganow/dotfiles/shell/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f $ZDOTDIR/.zshrc.fig-pre ] && . $ZDOTDIR/.zshrc.fig-pre
[ -f $ZDOTDIR/.zshrc.oh-my-zsh ] && . $ZDOTDIR/.zshrc.oh-my-zsh
[ -f $ZDOTDIR/.zshrc.for-peco ] && . $ZDOTDIR/.zshrc.for-peco
[ -f $ZDOTDIR/.zshrc.profile ] && . $ZDOTDIR/.zshrc.profile
[ -f $ZDOTDIR/.zshrc.for-enhancd ] && . $ZDOTDIR/.zshrc.for-enhancd
[ -f $ZDOTDIR/.zshrc.aws ] && . $ZDOTDIR/.zshrc.aws
[ -f $ZDOTDIR/.zshrc.hyper-tab-icons ] && . $ZDOTDIR/.zshrc.hyper-tab-icons
[ -f $ZDOTDIR/.zshrc.fig-post ] && . $ZDOTDIR/.zshrc.fig-post
[ -f $ZDOTDIR/.zshrc.completions ] && . $ZDOTDIR/.zshrc.completions

# To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
