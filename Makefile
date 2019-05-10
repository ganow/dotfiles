DOTFILESDIR := $(HOME)/local/src/github.com/ganow/dotfiles

all: oh-my-zsh neobundle ln python-lint italic-font

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
	ln -s $(DOTFILESDIR)/shell/.zshenv ~/.zshenv
	ln -s $(DOTFILESDIR)/shell/.zshrc ~/.zshrc
	ln -s $(DOTFILESDIR)/vim/.vimrc ~/.vimrc
	ln -s $(DOTFILESDIR)/.tmux.conf ~/.tmux.conf
	ln -s $(DOTFILESDIR)/.latexmkrc ~/.latexmkrc

python-lint:
	echo 'setup python lint'
	ln -s $(DOTFILESDIR)/pycodestyle ~/.config/pycodestyle
	mkdir -p ~/.config/yapf
	ln -s $(DOTFILESDIR)/.style.yapf ~/.config/yapf/style

italic-font:
	echo 'enable italic font'
	tic -o ~/.terminfo $(DOTFILESDIR)/shell/xterm-256color-italic.terminfo
