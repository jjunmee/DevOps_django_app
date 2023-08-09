from rest_framework.routers import DefaultRouter

from . import views
#from .views import *  이렇게 가져올 수 있지만 추천하지 않음

router = DefaultRouter()
router.register('topic', views.TopicViewSet, basename='topic')
