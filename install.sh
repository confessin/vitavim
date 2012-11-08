#!/bin/sh

# author: Mohammad Rafi (confessin@gmail.com)
# 

echo "Welcome friend!"
echo "You are about to Install vim configs"


if [ ! -f ~/.vim ]; then

    echo "Now, we will create ~/.vim and ~/.vimrc files to configure Vim."
    ln -sfn ${PWD} ~/.vim

fi

if [ ! -f ~/.vimrc ]; then
    echo "Linking Vimrc"
    ln -sfn ${PWD}/vimrc ~/.vimrc

fi

if [ ! -d "bundle" ]; then

    echo "Now, we will create a separate directory to store the bundles Vim will use."
    mkdir bundle
    mkdir -p tmp/backup tmp/swap tmp/undo

fi

if [ ! -d "bundle/vundle" ]; then

    echo "Then, we install Vundle (https://github.com/gmarik/vundle)."
    git clone https://github.com/gmarik/vundle.git bundle/vundle

fi

echo "let g:vimified_packages = ['general', 'fancy', 'css', 'js', 'os', 'html', 'coding', 'color']" > local.vimrc

echo "Press 'Enter' to continue installing all the bundles."
vim +BundleInstall +qall 2>/dev/null

echo "There you are! Welcome in our world."

echo "Enjoy!"
