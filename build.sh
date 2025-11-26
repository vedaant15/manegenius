#!/usr/bin/env bash
# Exit on error
set -o errexit

# 1. Install requirements
pip install -r requirements.txt

# 2. Collect static files
python manage.py collectstatic --no-input

# 3. Migrate database
python manage.py migrate

# 4. Create Superuser (Only if it doesn't exist)
if [[ -n "$DJANGO_SUPERUSER_USERNAME" ]]; then
    python manage.py createsuperuser --noinput || echo "Superuser already exists."
fi