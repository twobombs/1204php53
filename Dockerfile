FROM ubuntu:12.04
RUN apt-get update && apt-get -y install apache2 php5 php5-common php5-cli php5-curl php5-imap php5-gd php-pear php5-dev php5-fpm php-apc php5-mcrypt php5-ldap freetds-common libsybdb5 libaio-dev && apt-get clean all
RUN php5enmod mcrypt && php5enmod imap 
