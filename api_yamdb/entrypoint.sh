#!/bin/bash

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python manage.py migrate

# Loading dump data
echo "Loading dump data"
python manage.py loaddata fixtures.json

# Gunicorn run
echo "Gunicorn run"
gunicorn api_yamdb.wsgi:application --bind 0:8000