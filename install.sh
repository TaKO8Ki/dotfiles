#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/homefolder/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

# install packages and apps
brew bundle

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf ~/.vim ~/.config/nvim
ln -sf ~/.vimrc ~/.config/nvim/init.vim

[ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local

# shellをzshにする
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s /bin/zsh


cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
