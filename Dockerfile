
FROM simplyrets/debian-min:latest
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i s/httpredir.debian.org/debian.cse.msu.edu/g /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y php php-curl php-xml

ADD phrets.php /opt/
ADD index.php /opt/
ADD media /opt/media

EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/opt"]
