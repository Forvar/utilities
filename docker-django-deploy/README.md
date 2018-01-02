# Django, uWSGI and Nginx in a container, using Supervisord

This Dockerfile shows you *how* to build a Docker container with a fairly standard
and speedy setup for Django with uWSGI and Nginx.

Most of this setup comes from the excellent github on 
https://github.com/dockerfiles/django-uwsgi-nginx

### Build and run

* Clone this repository.
* Clone your repository inside the *django* folder.
* Edit *django-conf/dependencies.sh* to add dependencies
* Edit *django-conf/supervisor.conf* to start services
* Add this code to the bottom of the settings.py file:
```
try:
    from docker_local_settings import *
except ImportError:
    pass
```
A file called *docker_local_settings.py* will be added to the django project.
* `chmod +x manage.sh`
* `./manage.sh build`
* `./manage.sh run`
* Go to http://127.0.0.1:7480 to see if it works
* `./manage.sh attach`


Remember: the project folder is shared with the docker image, so any modification to the project is reflected on the docker machine.
