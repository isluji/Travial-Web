from django.shortcuts import render
from django.http import HttpResponse

from django.template import RequestContext
from django.shortcuts import render_to_response

from travial_web_app.models import Player

from django.contrib.auth.decorators import login_required



import requests
import os

def index(request):
    # return HttpResponse('Hello from Python!')
    return render(request, 'index.html')

@login_required
def player_profile(request):
    return render(request, 'player.html')

def rankings(request):
    # return render(request, 'rankings.html')
    players = Player.objects.order_by('-level')
    c = RequestContext(request, {'players_list' : players})
    return render_to_response("rankings.html", c)
    
