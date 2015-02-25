#!/usr/bin/env bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.2
rvm use 2.2 --default
ruby -v

# echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile