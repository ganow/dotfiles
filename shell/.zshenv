export ZDOTDIR=$HOME/local/src/github.com/ganow/dotfiles/shell
export DOTFILESDIR=$HOME/local/src/github.com/ganow/dotfiles
export EDITOR=vim
export LANG=en_US.UTF-8

## pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

## Rust setting
[ -f $HOME/.cargo/env ] && . "$HOME/.cargo/env"
