DOTFILESDIR := $(HOME)/local/src/github.com/ganow/dotfiles

all: oh-my-zsh vim ln python-lint italic-font

oh-my-zsh:
	echo 'setup oh-my-zsh'
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone git@github.com:zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone git@github.com:zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone git@github.com:bhilburn/powerlevel9k ~/.oh-my-zsh/custom/themes/powerlevel9k
	git clone --depth=1 git@github.com:romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

vim:
	echo 'setup neovim'
	mkdir -p ~/.config/nvim
	git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
	ln -sf $(DOTFILESDIR)/vim/vscode-init.lua ~/.config/nvim/vscode-init.lua
	ln -sf $(DOTFILESDIR)/vim/custom ~/.config/nvim/lua/custom

ln:
	echo 'make symlinks for setting files'
	ln -sf $(DOTFILESDIR)/shell/.zshenv ~/.zshenv
	ln -sf $(DOTFILESDIR)/shell/.zshrc ~/.zshrc
	ln -sf $(DOTFILESDIR)/shell/.hyper.js ~/.hyper.js
	ln -sf $(DOTFILESDIR)/.tmux.conf ~/.tmux.conf
	ln -sf $(DOTFILESDIR)/.latexmkrc ~/.latexmkrc
	mkdir -p ~/.config/zellij && ln -sf $(DOTFILESDIR)/zellij-config.kdl ~/.config/zellij/config.kdl

python-lint:
	echo 'setup python lint'
	mkdir -p ~/.config/yapf
	ln -sf $(DOTFILESDIR)/pycodestyle ~/.config/pycodestyle
	ln -sf $(DOTFILESDIR)/.style.yapf ~/.config/yapf/style

italic-font:
	echo 'enable italic font'
	tic -o ~/.terminfo $(DOTFILESDIR)/shell/xterm-256color-italic.terminfo

.PHONY: local server oh-my-zsh vim ln python-lint italic-font
