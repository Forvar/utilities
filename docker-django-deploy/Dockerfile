FROM ubuntu:16.04

MAINTAINER Dockerfiles

RUN apt-get update && apt-get upgrade -y && apt-get install -y git python python-dev python-setuptools python-pip nginx supervisor sqlite3 && pip install -U pip setuptools


# --- <Application dependent packages> ---

RUN apt-get install -y python3 python3-numpy python-tk redis-server
RUN pip install celery

# --- </Application dependent packages> ---

RUN rm -rf /var/lib/apt/lists/*
RUN pip install uwsgi
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx-app.conf /etc/nginx/sites-available/default
COPY supervisor-app.conf /etc/supervisor/conf.d/
COPY app/requirements.txt /home/docker/code/app/
RUN pip install -r /home/docker/code/app/requirements.txt
COPY . /home/docker/code/
RUN python /home/docker/code/app/manage.py collectstatic
RUN mkdir -p /home/docker/persistent/media
EXPOSE 80
CMD ["supervisord", "-n"]
