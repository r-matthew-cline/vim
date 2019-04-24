# vim
Place to store all things vim related

Requirements
============

Before installing the plugins in the .vimrc file, you will need to install Plugged using the following command

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

After vim-plug has bee installed, open a blank vim instance and run the PlugInstall command. That will install the plugins in the .vimrc file.

Finally you will have to build the YouCompleteMe server by going into the plugins directory and running the python install script.
