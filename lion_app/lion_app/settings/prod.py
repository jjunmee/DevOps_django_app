import os

from .base import *


SECRET_KEY = os.getenv("DJANGO_SECRET_KEY")

DEBUG = False

ALLOWED_HOSTS = [
    "lion-lb-18906494-b30bf29fcd8b.kr.lb.naverncp.comm",
]

CSRF_TRUSTED_ORIGINS = [
    "http://lion-lb-18906494-b30bf29fcd8b.kr.lb.naverncp.com",
]