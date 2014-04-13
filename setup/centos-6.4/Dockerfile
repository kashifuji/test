# centos
FROM centos:6.4

# author
MAINTAINER kashifuji

# workspace
WORKDIR /home/jenkins/docker/

# env
ENV HOME /home/jenkins/docker/
ENV PATH $PATH:/home/jenkins/docker/.rbenv/bin

# install git
RUN yum install git -y
RUN yum install gcc -y
RUN yum install openssl-devel openssl -y

# install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv 
RUN eval "$(rbenv init -)"
RUN git clone https://github.com/sstephenson/ruby-build.git  ~/.rbenv/plugins/ruby-build
RUN cd ~/.rbenv/plugins/ruby-build/; pwd; ./install.sh
RUN rbenv install 2.1.1

# for rails
RUN yum install sqlite-devel -y
RUN yum install gcc-c++ -y

# added test file
ADD test.sh /home/jenkins/docker/test.sh

