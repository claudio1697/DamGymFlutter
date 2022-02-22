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



  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
        fecha: json["fecha"] == null ? null : json["fecha"],
        hora: json["hora"] == null ? null : json["hora"],
        Clase: json["clase"] == null ? null : json["clase"],
        Cliente: json["cliente"] == null ? null : json["clienate"],
    );
  }
}
