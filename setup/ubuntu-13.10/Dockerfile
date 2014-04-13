# ubuntu 
FROM ubuntu:13.10

# author
MAINTAINER kashifuji

# workspace
WORKDIR /home/jenkins/docker/

# env
ENV HOME /home/jenkins/docker/
ENV PATH $PATH:/home/jenkins/docker/.rbenv/bin

# install git
RUN sudo apt-get install git-core -y
RUN sudo apt-get install curl -y
RUN sudo apt-get install gcc -y
RUN sudo apt-get install build-essential -y
RUN sudo apt-get install libssl-dev -y

# install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv 
RUN eval "$(rbenv init -)"
RUN git clone https://github.com/sstephenson/ruby-build.git  ~/.rbenv/plugins/ruby-build
RUN cd ~/.rbenv/plugins/ruby-build/; pwd; ./install.sh
RUN rbenv install 2.1.1

