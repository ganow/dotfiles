DOTFILESDIR := $(HOME)/local/src/github.com/ganow/dotfiles

all: shell vim ln python-lint italic-font

zsh:
	echo 'setup shell'
	cargo install sheldon
	cargo install starship --locked

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
	ln -sf $(DOTFILESDIR)/sheldon $(HOME)/.config/sheldon
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
