"""
WSGI config for data_manager project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/
"""

import os
import pymysql

from django.core.wsgi import get_wsgi_application

pymysql.install_as_MySQLdb()

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'data_manager.settings.local')

application = get_wsgi_application()
