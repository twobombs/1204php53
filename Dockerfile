FROM ubuntu:12.04

# core
RUN apt-get update && apt-get -y install apache2 php5 php5-common php5-cli php-pear php5-curl php5-imap php5-gd php-pear php5-dev php5-fpm php-apc php5-mcrypt php5-ldap freetds-common libsybdb5 libaio-dev && apt-get clean all

# config & install fastcgi
RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise main multiverse" >> /etc/apt/sources.list
RUN apt-get update && apt-get -y install libapache2-mod-fastcgi && a2enmod fastcgi

# settings
RUN a2enmod rewrite && a2enmod suexec &&  a2enmod actions alias

# optional tools
RUN apt-get -y install mc curl lynx

COPY run.sh /root/run.sh
COPY httpd.conf /etc/apache2/httpd.conf


EXPOSE 80 443

# extra: apt multiverse > libapache2-mod-fastcgi
# apt-get -y install libapache2-mod-fastcgi && a2enmod fastcgi
