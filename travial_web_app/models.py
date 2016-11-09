
from __future__ import unicode_literals

from django.db import models
from datetime import date

class Greeting(models.Model):
    when = models.DateTimeField('date created', auto_now_add=True)

class Player(models.Model):
    name = models.CharField(max_length=20, unique=True)
    city = models.CharField(max_length=50)
    birthdate = models.DateField(auto_now=False, auto_now_add=False)

    def is_adult(self):
        today = date.today()
        age = today.year - self.birthdate.year - ((today.month, today.day) < (self.birthdate.month, self.birthdate.day))

        return (age >= 18)

    def __str__(self):
        return self.nombre
