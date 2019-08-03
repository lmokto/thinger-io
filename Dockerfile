FROM ubuntu:18.10

# http://docs.thinger.io/deployment/#install-on-ubuntu-starting-from-1604-install-mongodb

USER root
WORKDIR /usr/src/app
ADD . /usr/src/app

RUN apt-get -y update &&   \
    apt-get -y install httping build-essential python3 python3-venv python3-dev python3-pip net-tools redis-server && \
    pip3 install --upgrade pi

## UPDATE SYSTEM

RUN apt-get -y update
RUN apt-get -y upgrade

## MONGODB

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" \
| tee /etc/apt/sources.list.d/mongodb-org-3.4.list

RUN apt-get -y update
RUN apt-get -y install apt-utils
RUN apt-get install -y mongodb-org
RUN apt-get install -y snapd

RUN mkdir -p /data/db
#RUN systemctl status snapd.service
#RUN snap install thinger-maker-server

CMD ["/usr/bin/mongod"] 

EXPOSE 27017
EXPOSE 28017
EXPOSE 22
