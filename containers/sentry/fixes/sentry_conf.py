import os.path

from sentry.conf.server import *

ROOT = os.path.dirname(__file__)
SENTRY_CACHE = 'sentry.cache.redis.RedisCache'
DATABASES = {
    'default': {
        # You can swap out the engine for MySQL easily by changing this value
        # to ``django.db.backends.mysql`` or to PostgreSQL with
        # ``django.db.backends.postgresql_psycopg2``
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'sentry',
        'USER': 'sentry',
        'PASSWORD': 'sentry',
        'HOST': 'localhost',
        'PORT': '',
    }
}

SENTRY_KEY = 'my69eAMYjzqtmfaRJ107MeXCYDTaxQdNZPr8YOf/zOV5pIUoZa5biA=='

# Set this to false to require authentication
SENTRY_PUBLIC = False

SENTRY_ALLOW_REGISTRATION = False

SENTRY_WEB_HOST = '0.0.0.0'
SENTRY_WEB_PORT = 9000

ALLOWED_HOSTS = ['sentry.local']

SENTRY_URL_PREFIX = 'http://sentry.local'
SENTRY_LOGIN_URL = 'http://sentry.local/login/'
