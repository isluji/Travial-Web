from django.shortcuts import render
from django.http import HttpResponse

from .models import Greeting

import requests
import os

def index(request):
    # return HttpResponse('Hello from Python!')
    return render(request, 'index.html')
