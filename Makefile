DOTFILESDIR := $(HOME)/local/src/github.com/ganow/dotfiles

all: shell vim ln python-lint italic-font

claude:
	echo 'setup claude'
	mkdir -p ~/.claude
	ln -sf $(DOTFILESDIR)/claude/settings.json ~/.claude/settings.json
	ln -sf $(DOTFILESDIR)/claude/statusline-command.sh ~/.claude/statusline-command.sh

zsh:
	echo 'setup shell'
	cargo install sheldon
	cargo install starship --locked

vim:
	echo 'setup neovim'
	mkdir -p ~/.config
	ln -sf $(DOTFILESDIR)/nvim ~/.config/nvim

ln:
	echo 'make symlinks for setting files'
	ln -sf $(DOTFILESDIR)/shell/.zshenv ~/.zshenv
	ln -sf $(DOTFILESDIR)/shell/.zshrc ~/.zshrc
	ln -sf $(DOTFILESDIR)/sheldon $(HOME)/.config/sheldon
	ln -sf $(DOTFILESDIR)/.tmux.conf ~/.tmux.conf
	ln -sf $(DOTFILESDIR)/.latexmkrc ~/.latexmkrc
	mkdir -p ~/.config/zellij && ln -sf $(DOTFILESDIR)/zellij-config.kdl ~/.config/zellij/config.kdl
	mkdir -p ~/.config/ghostty && ln -sf $(DOTFILESDIR)/ghostty/config ~/.config/ghostty/config

python-lint:
	echo 'setup python lint'
	mkdir -p ~/.config/yapf
	ln -sf $(DOTFILESDIR)/pycodestyle ~/.config/pycodestyle
	ln -sf $(DOTFILESDIR)/.style.yapf ~/.config/yapf/style

italic-font:
	echo 'enable italic font'
	tic -o ~/.terminfo $(DOTFILESDIR)/shell/xterm-256color-italic.terminfo

.PHONY: all claude zsh vim ln python-lint italic-font
