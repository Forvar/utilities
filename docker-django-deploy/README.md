
1) clone this repository:
	git clone https://github.com/dpaissan/utility_scripts.git

2) Go to utility_scripts/docker-django-deploy directory
	cd utility_scripts/docker-django-deploy

3) Clone your django project here naming it "app". It must contain a requirements.txt file.
	git clone <YourProject> app

4) Edit the Dockerfile, installing all things that your project needs. For example the current Dockerfile installs python3 redis and celery.

5) Edit the supervisor-app.conf file starting all processes that you need. (keep uwsgi and nginx)

6) Edit the uwsgi.ini file changing "phoneme_analysis.wsgi:application" with "<YourProject>.wsgi:application"

7) run: "sudo docker build -t webapp ."

8) run: "sudo docker -d -p 8000:80 webapp" to run docker and map the local port 8000 to it.


NB: Remember to create a local settings with this content:

from settings import *

ALLOWED_HOSTS = ['*']
MEDIA_ROOT = '/home/docker/persistent/media/'
STATIC_ROOT = '/home/docker/volatile/static/'

importing this file in settings.py with this code:

try:
    from local_settings import *
except ImportError:
    pass
