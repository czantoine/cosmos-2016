# Cosmos 2016
FROM debian:12

LABEL \ 
    maintainer="https://github.com/czantoine/cosmos-2016" \
    license="Apache-2.0"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apache2 && \
    apt-get clean

WORKDIR /workspace

COPY ./workspace /var/www/html/

RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 770 /var/www/html/

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]