import os

from .base import *


SECRET_KEY = os.getenv("DJANGO_SECRET_KEY")

DEBUG = True

ALLOWED_HOSTS = [
    "be-lb-staging-19117277-824e0dccc35c.kr.lb.naverncp.com",
]

# CSRF_TRUSTED_ORIGINS = [
#     "http://be-lb-staging-19117277-824e0dccc35c.kr.lb.naverncp.com",
# ]