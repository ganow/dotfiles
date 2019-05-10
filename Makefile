DOTFILESDIR := $(HOME)/local/src/github.com/ganow/dotfiles

all: local

local: server atom

server:  oh-my-zsh neobundle ln python-lint italic-font

oh-my-zsh:
	echo 'setup oh-my-zsh'
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone git@github.com:zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone git@github.com:bhilburn/powerlevel9k ~/.oh-my-zsh/custom/themes/powerlevel9k

neobundle:
	echo 'setup vim neobundle'
	mkdir -p ~/.vim/bundle
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

ln:
	echo 'make symlinks for setting files'
	ln -sf $(DOTFILESDIR)/shell/.zshenv ~/.zshenv
	ln -sf $(DOTFILESDIR)/shell/.zshrc ~/.zshrc
	ln -sf $(DOTFILESDIR)/vim/.vimrc ~/.vimrc
	ln -sf $(DOTFILESDIR)/.tmux.conf ~/.tmux.conf
	ln -sf $(DOTFILESDIR)/.latexmkrc ~/.latexmkrc

python-lint:
	echo 'setup python lint'
	ln -sf $(DOTFILESDIR)/pycodestyle ~/.config/pycodestyle
	mkdir -p ~/.config/yapf
	ln -sf $(DOTFILESDIR)/.style.yapf ~/.config/yapf/style

italic-font:
	echo 'enable italic font'
	tic -o ~/.terminfo $(DOTFILESDIR)/shell/xterm-256color-italic.terminfo

atom:
	echo 'make symlinks for atom'
	ln -sf $(DOTFILESDIR)/atom/config.cson ~/.atom/config.cson
	ln -sf $(DOTFILESDIR)/atom/keymap.cson ~/.atom/keymap.cson
	ln -sf $(DOTFILESDIR)/atom/styles.less ~/.atom/styles.less

.PHONY: local server oh-my-zsh neobundle ln python-lint italic-font atom
