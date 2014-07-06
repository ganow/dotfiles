if filereadable(expand('$HOME/dotfiles/.vimrc.neobundle'))
  source $HOME/dotfiles/.vimrc.neobundle
  
  if filereadable(expand('$HOME/dotfiles/.vimrc.plugin'))
    source $HOME/dotfiles/.vimrc.plugin
  endif

  if filereadable(expand('$HOME/dotfiles/.vimrc.plugin-settings'))
    source $HOME/dotfiles/.vimrc.plugin-settings
  endif
endif

if filereadable(expand('$HOME/dotfiles/.vimrc.pure'))
  source $HOME/dotfiles/.vimrc.pure
endif

