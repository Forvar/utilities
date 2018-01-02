FROM ubuntu:16.04

MAINTAINER Dockerfiles
ARG appname=app

RUN apt-get update && apt-get upgrade -y && apt-get install -y git python python-dev python-setuptools python-pip nginx supervisor sqlite3 && pip install -U pip setuptools
ADD django-conf/dependencies.sh /tmp/dependencies.sh
RUN bash /tmp/dependencies.sh
RUN rm -rf /var/lib/apt/lists/*

RUN pip install uwsgi
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY static/nginx-app.conf /etc/nginx/sites-available/default
COPY django-conf/supervisor.conf /etc/supervisor/conf.d/
COPY django/$appname /home/docker/code/app/
RUN pip install -r /home/docker/code/app/requirements.txt
COPY static /home/docker/code/
RUN echo "module=$appname.wsgi:application" >> /home/docker/code/uwsgi.ini
RUN python /home/docker/code/app/manage.py collectstatic
RUN mkdir -p /home/docker/persistent/media
EXPOSE 80
CMD ["supervisord", "-n"]
