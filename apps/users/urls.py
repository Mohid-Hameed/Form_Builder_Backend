from rest_framework.routers import DefaultRouter
from django.urls import path
from .views import UserViewSet, SignupView, LoginView, UserInfoView

router = DefaultRouter()
router.register(r'users', UserViewSet, basename='user')

urlpatterns = [
    path('signup/', SignupView.as_view(), name='signup'),
    path('login/', LoginView.as_view(), name='login'),
    path('me/', UserInfoView.as_view(), name='user-info'),
]
urlpatterns += router.urls
