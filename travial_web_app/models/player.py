
from django.db import models
from enums import Enums
from django.forms import ModelForm

from django.core.validators import MaxValueValidator
from django.contrib.auth.models import User

class Player(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    avatar = models.ImageField(upload_to="user_avatars/", null=True, blank=True)
    birthdate = models.DateField(auto_now=False, auto_now_add=False)
    gender = models.CharField(max_length=1, choices=Enums.GENDER_CHOICES)
    country = models.CharField(default='Spain', max_length=25)
    level = models.IntegerField(default=1, validators=[MaxValueValidator(10)])
    exp_points = models.IntegerField(default=0, validators=[MaxValueValidator(1000)])

    def age(self):
        today = date.today()
        age = today.year - self.birthdate.year - ((today.month, today.day) < (self.birthdate.month, self.birthdate.day))
        
        return age
        
    def is_adult(self):
        return (self.age >= 18)

    def __str__(self):
        return self.user.username
        
    class Meta:
        ordering = ('user',)
