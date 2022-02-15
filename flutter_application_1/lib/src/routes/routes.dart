import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/Calendario.dart';
import 'package:flutter_application_1/src/pages/HomePage.dart';
import 'package:flutter_application_1/src/pages/SeleccionarReserva.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePagee(),
    'calendarioPantalla': (BuildContext context) => calen(),
    'realizarReserva': (BuildContext context) => SeleccionarReserva()
  };
}
