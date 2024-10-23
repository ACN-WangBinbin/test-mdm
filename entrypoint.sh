#!/bin/ash

touch ./logs/gunicorn.log
touch ./logs/gunicorn-access.log

export DJANGO_SETTINGS_MODULE=data_manager.settings.${DJANGO_ENV}

echo $DJANGO_SETTINGS_MODULE

python --version

python manage.py makemigrations

echo step1

python manage.py migrate --settings=data_manager.settings.${DJANGO_ENV}

echo step2

rm -rf ./static
python manage.py collectstatic

echo step3

exec gunicorn data_manager.wsgi:application \
    --name master-data \
    --bind 0.0.0.0:8000 \
    --workers 2 \
    --log-level=info \
    --log-file=./logs/gunicorn.log \
    --access-logfile=./logs/gunicorn-access.log

echo step4
