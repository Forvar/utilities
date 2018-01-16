#!/bin/bash

port=7480
appname=`ls django`

if [ $1 = "build" ]
then
	cp static/docker_local_settings.py django/$appname/$appname/docker_local_settings.py
	docker build -f static/Dockerfile --build-arg appname=$appname -t docker_$appname .
fi

if [ $1 = "run" ]
then
	docker run  --name="cdocker_$appname" -d -p 7480:80 -v `pwd`/django/$appname:/home/docker/code/app docker_$appname
fi

if [ $1 = "start" ]
then
	docker start cdocker_$appname
fi

if [ $1 = "pull" ]
then
	cd django/$appname
	git pull
fi

if [ $1 = "attach" ]
then
	sudo docker exec -i -t cdocker_$appname /bin/bash
fi

if [ $1 = "refresh" ]
then
	sudo docker exec -i -t cdocker_$appname /bin/bash /home/docker/code/refresh-deploy.sh
fi
