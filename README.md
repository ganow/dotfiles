dotfiles
========

## How to Install

### oh-my-zsh

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git@github.com:felixr/docker-zsh-completion ~/.oh-my-zsh/custom/plugins/docker
git clone git@github.com:zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

[https://github.com/robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

### neobundle

```shell
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

### enhancd

### link setting files to home directory

```shell
ln -s $ZDOTDIR/.zshenv ~/.zshenv
ln -s $ZDOTDIR/.zshrc ~/.zshrc
ln -s $ZDOTDIR/.vimrc ~/.vimrc
ln -s $ZDOTDIR/.tmux.conf ~/.tmux.conf
ln -s $ZDOTDIR/powerline.zsh-theme ~/.oh-my-zsh/custom/powerline.zsh-theme
```

### link configuration files for Python lint.

```shell
ln -s $ZDOTDIR/pycodestyle ~/.config/pycodestyle
mkdir ~/.config/yapf
ln -s $ZDOTDIR/.style.yapf ~/.config/yapf/style
```

### enable italic font

```shell
tic -o ~/.terminfo xterm-256color-italic.terminfo
```
