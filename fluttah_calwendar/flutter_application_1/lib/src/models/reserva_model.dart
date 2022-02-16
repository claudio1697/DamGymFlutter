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

  Reserva({
    this.fecha,
    this.hora,
  });

  Reserva.fromJsonMap(Map<String, dynamic> json) {
    fecha = json['fecha'];
    hora = json['hora'];
  }
}
