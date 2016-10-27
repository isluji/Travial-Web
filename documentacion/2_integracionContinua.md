
### Explicar por qué se ha elegido el sistema de test y de integración continua.

Como sistema de test, he elegido django-nose (un módulo que implementa nose en django). He elegido éste porque estoy desarrollando la aplicación en Django, y django-nose aporta una serie de mejoras específicas sobre el nose estándar de Python (evita testear las apps estándar presentes en INSTALLED_APPS y aumenta la eficiencia en la ejecución de los tests, entre otras). Además, funciona con los mismos plugin que nose, y se integra con Django para ejecutarse con su comando de test (python manage.py test).

Como sistema de integración continua he elegido Travis-CI, debido a que es el que se ha mencionado en el material de la asignatura y es bastante popular y usado.
