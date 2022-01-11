FROM php:7.4-apache

LABEL maintainer="Derexd<derex (at) outlook (dot) com (dot) br>"

RUN useradd -rm -d /home/solder -s /bin/bash -g root -G sudo -u 1001 solder
RUN echo 'solder:123' | chpasswd

RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get -y install nano --no-install-recommends
RUN apt-get install git zip unzip wget sudo -y
RUN apt-get clean

#install extensions php
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo_mysql

#RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini


#install node
RUN wget https://nodejs.org/dist/v16.13.2/node-v16.13.2-linux-x64.tar.xz
RUN tar -xvf node-v16.13.2-linux-x64.tar.xz
RUN mv ./node-v16.13.2-linux-x64 /opt/node
RUN echo "export PATH=/opt/node/bin/:$PATH" >> ~/.bashrc
RUN . ~/.bashrc
RUN rm -f ./node-v16.13.2-linux-x64.tar.xz

RUN echo 'alias pas="php artisan serve --host=$(hostname -i) --port 8000"' >> ~/.bashrc

#install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php ./composer-setup.php --install-dir=/usr/local/bin/ --filename=composer
RUN rm -f ./composer-setup.php
RUN echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc
RUN . ~/.bashrc

RUN service apache2 restart

#RUN cd /var/www/html && git clone https://github.com/TechnicPack/TechnicSolder.git && cd /var/www/html/TechnicSolder

EXPOSE 80

EXPOSE 443

EXPOSE 8000