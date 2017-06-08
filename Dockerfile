FROM ubuntu:14.04
MAINTAINER Fausto Carrera <fausto.carrera@gmx.com>

ENV DEBIAN_FRONTEND noninteractive

# Install necessary software
RUN apt-get update
RUN apt-get install -y python-pip python-dev uwsgi-plugin-python
RUN apt-get install -y nginx
RUN apt-get install -y supervisor

# Copy files
COPY nginx/flask.conf /etc/nginx/sites-available/
COPY supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY app /var/www

# Create neccesary folders
RUN mkdir -p /var/log/nginx/app
RUN mkdir -p /var/log/uwsgi/app
RUN mkdir -p /var/log/supervisor

# Change permissions
RUN chown -R www-data:www-data /var/www
RUN chown -R www-data:www-data /var/log

# finish setup
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/flask.conf /etc/nginx/sites-enabled/flask.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN pip install -r /var/www/requirements.txt

# run
CMD ["/usr/bin/supervisord"]
