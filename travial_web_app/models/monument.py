
from django.db import models
from enums import Enums

from django.core.validators import MaxValueValidator

class Monument(models.Model):
    name = models.CharField(max_length=25)
    city = models.CharField(max_length=25)
    monum_type = models.CharField(max_length=25)
    civilization = models.CharField(max_length=25)
    
    # Date (exact or approximated) when the building was finished
    approx_end_date = models.IntegerField(validators=[MaxValueValidator(2000)])
    
    # Architectural style
    arch_style = models.CharField(max_length=25)
    
    def __str__(self):
        return self.name

    class Meta:
        ordering = ('name',)
