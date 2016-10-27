from django.test import TestCase

from models import Player

# Create your tests here.
class PlayerTestCase(TestCase):
    def setUp(self):
        # Create some players to test their functionality
        Player.objects.create(name="mayor", city="Granada", birthdate="1994-10-25")
        Player.objects.create(name="menor", city="Cordoba", birthdate="2003-11-17")

    def test_player_created(self):
        # Here we test if the objects were created
        mayor = Player.objects.get(name="mayor")
        menor = Player.objects.get(name="menor")

        self.assertEqual(mayor.name, "mayor")
        self.assertEqual(menor.name, "menor")

    def test_player_age(self):
        mayor = Player.objects.get(name="mayor")
        menor = Player.objects.get(name="menor")

        # Check if the method that returns if the player is adult works correctly
        self.assertTrue(mayor.is_adult())
        self.assertFalse(menor.is_adult())
