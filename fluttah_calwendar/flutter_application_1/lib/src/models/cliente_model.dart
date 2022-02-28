class Clientes {
  List<Cliente> items = [];
  Clientes();

  Clientes.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final cliente = new Cliente.fromJsonMap(item);
      items.add(cliente);
    }
  }
}

class Cliente {
  String? nombre;
  String? apellidos;
  String? direccion;
  int? telefono;
  String? dni;

  Cliente({
    this.nombre,
    this.apellidos,
    this.direccion,
    this.telefono,
    this.dni
  });

  Cliente.fromJsonMap(Map<String, dynamic> json) {
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    direccion = json['direccion'];
    telefono = json['telefono'];
    dni = json['dni'];
  }
}
