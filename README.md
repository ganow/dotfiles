dotfiles
========

## How to Install

### oh-my-zsh

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git@github.com:felixr/docker-zsh-completion ~/.oh-my-zsh/custom/plugins/docker
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
ln -s $ZDOTDIR/monty.zsh-theme ~/.oh-my-zsh/custom/monty.zsh-theme
```

### enable italic font

```shell
tic -o ~/.terminfo xterm-256color-italic.terminfo
```

