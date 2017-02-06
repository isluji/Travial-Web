
from django.db import models
from enums import Enums

from monument import Monument
from question import Question

from django.core.validators import MaxValueValidator

class Trivia(models.Model):
    title = models.CharField(max_length=50)
    image = models.ImageField(upload_to="trivia_images/", null=True, blank=True)
    monument = models.ForeignKey(Monument, on_delete=models.CASCADE)
    size = models.CharField(max_length=1, choices=Enums.SIZE_CHOICES)
    difficulty = models.CharField(max_length=1, choices=Enums.DIFFICULTY_CHOICES)
    questions = models.ManyToManyField(Question)
    max_hints = models.IntegerField(default=0, validators=[MaxValueValidator(5)])

    def __str__(self):
        return self.title

    class Meta:
        ordering = ('monument',)
