if filereadable(expand('$DOTFILESDIR/vim/.vimrc.neobundle'))
  source $DOTFILESDIR/vim/.vimrc.neobundle
  
  if filereadable(expand('$DOTFILESDIR/vim/.vimrc.plugin'))
    source $DOTFILESDIR/vim/.vimrc.plugin
  endif

  if filereadable(expand('$DOTFILESDIR/vim/.vimrc.plugin-settings'))
    source $DOTFILESDIR/vim/.vimrc.plugin-settings
  endif
endif

if filereadable(expand('$DOTFILESDIR/vim/.vimrc.filetype'))
  source $DOTFILESDIR/vim/.vimrc.filetype
endif

if filereadable(expand('$DOTFILESDIR/vim/.vimrc.pure'))
  source $DOTFILESDIR/vim/.vimrc.pure
endif

