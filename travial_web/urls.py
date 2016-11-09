from django.conf.urls import include, url

from django.contrib import admin
admin.autodiscover()

import travial_web_app.views

# Examples:
# url(r'^$', 'travial_web.views.home', name='home'),
# url(r'^blog/', include('blog.urls')),

urlpatterns = [
    url(r'^$', travial_web_app.views.index, name='index'),
    url(r'^db', travial_web_app.views.db, name='db'),
    url(r'^admin/', include(admin.site.urls)),
]
