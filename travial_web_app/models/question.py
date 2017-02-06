
from django.db import models
from enums import Enums
import jsonfield

class Question(models.Model):
    text = models.CharField(max_length=100)
    options = jsonfield.JSONField()
    solution = models.CharField(max_length=100)
    hint = models.CharField(max_length=100)

    def __str__(self):
        return self.text

    class Meta:
        ordering = ('?',)
