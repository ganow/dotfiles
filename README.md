dotfiles
========

## How to Install

### oh-my-zsh

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git@github.com:zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git@github.com:bhilburn/powerlevel9k ~/.oh-my-zsh/custom/themes/powerlevel9k
pip install --user powerline-status
```

[https://github.com/robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#font-installation)

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
