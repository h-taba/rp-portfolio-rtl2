from django.urls import path
from . import views
# app_name = 'ui'
urlpatterns = [
    path("", views.ui_index, name="ui_index"),
    # path("<int:pk>/", views.blog_detail, name="blog_detail"),
    # path("<category>/", views.blog_category, name="blog_category"),
]
