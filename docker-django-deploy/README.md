# Django, uWSGI and Nginx in a container, using Supervisord

This Dockerfile shows you *how* to build a Docker container with a fairly standard
and speedy setup for Django with uWSGI and Nginx.

Most of this setup comes from the excellent github on 
https://github.com/dockerfiles/django-uwsgi-nginx

Video instructions: https://www.youtube.com/watch?v=uVZ313po9qg


### Build

* Clone this repository.
* Clone your Django project repository inside the *django* folder.
* Edit *django-conf/dependencies.sh* to add dependencies
* Edit *django-conf/supervisor.conf* to start services
* A file called *docker_local_settings.py* will be added to the django project, so add this code to the bottom of your django project *settings.py* file:
```
try:
    from docker_local_settings import *
except ImportError:
    pass
```
* `chmod +x manage.sh`
* `./manage.sh build`


### Run

* `./manage.sh run`
* Go to http://127.0.0.1:7480 to see if it works

### Attach

To open a bash inside the docker image run:
```
./manage.sh attach
```


### Hotfixes

Since the project folder is shared with the docker image, any modification to the django project is reflected on the docker machine. once changes has been applied to the django project you can restart running services with the following command:
```
./manage.sh refresh
```
This command will also perform the collect static operation.
