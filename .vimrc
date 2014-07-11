if filereadable(expand('$ZDOTDIR/.vimrc.neobundle'))
  source $ZDOTDIR/.vimrc.neobundle
  
  if filereadable(expand('$ZDOTDIR/.vimrc.plugin'))
    source $ZDOTDIR/.vimrc.plugin
  endif

  if filereadable(expand('$ZDOTDIR/.vimrc.plugin-settings'))
    source $ZDOTDIR/.vimrc.plugin-settings
  endif
endif

if filereadable(expand('$ZDOTDIR/.vimrc.filetype'))
  source $ZDOTDIR/.vimrc.filetype
endif

if filereadable(expand('$ZDOTDIR/.vimrc.pure'))
  source $ZDOTDIR/.vimrc.pure
endif

