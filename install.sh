#!/bin/sh

# author: Mohammad Rafi (confessin@gmail.com)
# 
set -e
echo "Welcome friend!"
echo "You are about to Install vim configs"

new_installation=$1

if [ "$1" = "new" ]; then
    # Only first time.
    # Install vim with all the supports needed.
    sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        ruby-dev git
    # remove existing vim.
    sudo apt-get remove vim vim-runtime gvim

    cd ..
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp \
                --enable-pythoninterp \
                --with-python-config-dir=/usr/lib/python2.7/config \
                --enable-perlinterp \
                --enable-luainterp \
                --enable-gui=gtk2 --enable-cscope --prefix=/usr
    make VIMRUNTIMEDIR=/usr/share/vim/vim74
    sudo make install

    # Make defaults.
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    sudo update-alternatives --set editor /usr/bin/vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    sudo update-alternatives --set vi /usr/bin/vim
fi


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

#######################################################################
#                        You Complete me conf.                        #
#######################################################################
if [ "$1" = "new" ]; then
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev python3-dev
    cd ~/.vim/bundle/YouCompleteMe
    sudo apt-get install node npm go
    ./install.py --clang-completer --gocode-completer --tern-completer
fi
#######################################################################
#                                  YMC Ends.                          #
#######################################################################


echo "There you are! Welcome in our world."

echo "Enjoy!"

if ! foobar_loc="$(type -p "$flake8")" || [ -z "$foobar_loc" ]; then
    echo
    echo "PS: You need to install flake8 for python if you want to use the automatic linters;
    You can get it by pip install flake8"
fi

if ! foobar_loc="$(type -p "$go")" || [ -z "$foobar_loc" ]; then
    echo
    echo "PS: You need to install flake8 for python if you want to use the automatic linters;
    You can get it by pip install flake8"
fi


