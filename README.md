dotfiles
========

## はじめにすること

1. oh-my-zshのインストール
2. neobundleのインストール
3. enhancdのインストール
4. 以下のコマンドを実行

```
ln -s $ZDOTDIR/.zshenv ~/.zshenv
ln -s $ZDOTDIR/.zshrc ~/.zshrc
ln -s $ZDOTDIR/.vimrc ~/.vimrc
ln -s $ZDOTDIR/.tmux.conf ~/.tmux.conf
ln -s $ZDOTDIR/monty.zsh-theme ~/.oh-my-zsh/custom/monty.zsh-theme
git clone git@github.com:felixr/docker-zsh-completion ~/.oh-my-zsh/custom/plugins/docker
```

