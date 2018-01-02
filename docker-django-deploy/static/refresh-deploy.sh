supervisorctl restart all
yes yes | python /home/docker/code/app/manage.py collectstatic
