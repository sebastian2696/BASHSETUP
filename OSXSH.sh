#!/bin/bash

#apt-get = "brew"
SVF="cd $SVFV_ENV"


#removed linux-headers-$(uname -r) 

APT=(build-essential automake autoconf cmake wget curl zsh vim cscope git tmux sl shellcheck)
VIM=(ack ctags ruby)
POWERLINE=(socat libpython2.7-dev libffi-dev libuv-dev)
POWERLINE_PIP=(psutil cffi pygit2 pyuv bzr i3ipc)

SVFV_env_usage()
{
    echo -e "SVF Ubuntu Environment Setup Script"
    echo -e "Usage:"
    echo -e "\t1) set environment variable SVFV_ENV to be path of a temp directory"
    echo -e "\n aka export SVFV_ENV=$HOME/xxx"
    echo -e "\t xxx being the the temp directory"
    exit 1
}

SVFV_env_install_deps()
{
    echo "**** Installing dependencies ****"

    $SVF

    for i in ${APT[@]}; do
        brew install -y $i
    done

    for i in ${VIM[@]}; do
        brew install -y $i
    done

    for i in ${POWERLINE[@]}; do
        brew install -y $i
    done

    SVFV_env_get_ruby_gems
    SVFV_env_get_pip
    SVFV_env_get_libgit

    for i in ${POWERLINE_PIP[@]}; do
        sudo pip install -H $i
    done

    pip install --user git+git://github.com/Lokaltog/powerline --verbose

    echo "**** Done installing dependencies ****"
}

SVFV_env_get_pip()
{
    echo "**** Installing pip ****"

    $SVF

    wget https://bootstrap.pypa.io/get-pip.py
    sudo python ./get-pip.py

    echo "**** Done installing pip ****"
}

SVFV_env_get_libgit()
{
    echo "**** Installing libgit2 ****"

    $SVF

    wget https://github.com/libgit2/libgit2/archive/v0.25.1.tar.gz
    tar xfz v0.25.1.tar.gz
    cd libgit2-0.25.1
    cmake .
    make
    sudo make install

    echo "**** Done installing libgit2 ****"
}

SVFV_env_get_ruby_gems()
{
    echo "**** Installing ruby gems ****"

    $SVF

    wget https://rubygems.org/rubygems/rubygems-2.6.6.tgz
    tar xfz rubygems-2.6.6.tgz
    cd rubygems-2.6.6
    sudo ruby setup.rb install
    sudo gem install rake

    echo "**** Done installing ruby gems ****"
}

SVFV_env_make_directories()
{
    echo "**** Making directories ****"

    if ! [ -d "$SVFV_ENV" ]
    then
        mkdir $SVFV_ENV
    fi

    echo "**** Done making directories ****"
}

SVFV_env_clone_repos()
{
    echo "**** Cloning repositories ****"

    $SVF

    git clone https://github.com/sebastian2696/BASHSETUP.git

    git clone https://github.com/nks5295/janus.git
    $SVF/janus
    git submodule update --init

    echo "**** Done cloning repositories ****"
}

SVFV_env_setup_powerline_fonts()
{
    echo "**** Installing powerline fonts ****"

    $SVF

    git clone https://github.com/powerline/fonts.git

    cd fonts

    ./install.sh

    echo "**** Done installing powerline fonts ****"
}

SVFV_env_setup_vim()
{
    echo "**** Setting up VIM ****"

    $SVF

    curl -L https://bit.ly/janus-bootstrap | bash

    cp -r janus ~/.janus

    ln -s ~/.janus/vimrc.before ~/.vimrc.before
    ln -s ~/.janus/vimrc.after ~/.vimrc.after

    echo "**** Done setting up VIM ****"
}

SVFV_env_setup_zsh()
{
    echo "**** Setting up ZSH ****"

    $SVF

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    $SVF/BASHSETUP
    pwd
    cp -r scripts ~/.scripts
    cp aliases ~/.aliases
    cp zshrc ~/.zshrc
    cp tmux.conf ~/.tmux.conf
    cp vimrc ~/.vimrc
    echo "**** Done setting up ZSH ****"
}

SVFV_env_clean()
{
    rm -rf $SVF
}

main()
{
    if [ -z "$SVFV_ENV" ];
    then
       echo -e "ERROR: Set environment variable\n"
       SVFV_env_usage
    fi

    echo '\n$$$$ Starting environment init $$$$\n'
    sleep .5

    SVFV_env_install_deps
    SVFV_env_make_directories
    SVFV_env_clone_repos
    SVFV_env_setup_powerline_fonts
    SVFV_env_setup_vim
    SVFV_env_setup_zsh
    SVFV_env_clean

    echo '\n$$$$ Finished environment init $$$$\n'
}

main
