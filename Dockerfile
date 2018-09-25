FROM ubuntu:18.04

MAINTAINER t333ura <t333ura@gmail.com>

RUN sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
RUN apt update && apt -y upgrade

# Set the locale
RUN apt -y install locales
RUN sed -i.bak -e "s%# en_US.UTF-8 UTF-8%en_US.UTF-8 UTF-8%g" /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

# Development Environment
RUN apt -y install vim git python3 python3-pip
RUN pip3 install numpy pandas matplotlib Pillow tqdm tensorflow Keras jupyterlab

WORKDIR /workdir

#EXPOSE 8888

CMD echo "Now running!"
CMD bash
