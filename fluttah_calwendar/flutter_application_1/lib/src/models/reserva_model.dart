import 'package:flutter_application_1/src/models/cliente_model.dart';

import 'clase_model.dart';

class Reservas {
  List<Reserva> items = [];
  Reservas();

  Reservas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final reserva = new Reserva.fromJsonMap(item);
      items.add(reserva);
    }
  }
}

class Reserva {
  String? fecha;
  String? hora;
  Clase? clase;
  Cliente? cliente;

  Reserva(this.fecha, this.hora, [this.clase]);



  Reserva.fromJsonMap(Map<String, dynamic> json) {
    fecha = json['fecha'];
    hora = json['hora'];

    if (json['clase'] != null) {
      clase = Clase.fromJsonMap(json['monitor']);
    }
  }
}
