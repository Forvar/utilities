#!/bin/bash

apt install -y virtualenv virtualenvwrapper
mkdir ~/.virtualenvs

echo '# virtualenv' >> ~/.bashrc
echo '' >> ~/.bashrc
echo 'export WORKON_HOME=~/.virtualenvs' >> ~/.bashrc 
echo 'source ~/.local/bin/virtualenvwrapper.sh' >> ~/.bashrc

export WORKON_HOME=~/.virtualenvs
source ~/.local/bin/virtualenvwrapper.sh
