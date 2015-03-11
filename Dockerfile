FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y build-essential nodejs npm php5-fpm php5-cli php5-mcrypt php5-mysql nginx git mysql-client php5-curl php5-imagick
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g bower gulp
RUN php5enmod mcrypt
RUN sed -i "s#;cgi.fix_pathinfo=1#cgi.fix_pathinfo=0#" /etc/php5/fpm/php.ini
RUN apt-get clean

COPY etc/nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD service php5-fpm start && nginx
