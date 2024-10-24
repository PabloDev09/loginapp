import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier
{
  var logged = false;

  final Map<String, String> usuario = 
  {
    'nombre' : "Pablo",
    'clave' : "12345",
    'apellidos' : "Martínez Guerbós",
    'curso' : "2º DAM",
    'telefono' : "657649534",
    'correo' : "pmargue0511@g.educaand.es",
    'edad' : "18",
    'fecha_nacimiento' : "04/11/2005",
    'foto' : "../../images/imagen.jpeg"
  };

  bool checkIsCorrectValues(String valueUsername, String valuePassUsername) 
  {
    bool checkIsCorrectValues = false;    
    if(valueUsername.toUpperCase() == usuario['nombre']?.toUpperCase() && valuePassUsername.toUpperCase() == usuario['clave']?.toUpperCase())
    {
        _logIn();
       return !checkIsCorrectValues;
    }
    return checkIsCorrectValues;
  }

  void logOut()
  {
    logged = false;
  }

    void _logIn()
  {
    logged = true;
  }
}