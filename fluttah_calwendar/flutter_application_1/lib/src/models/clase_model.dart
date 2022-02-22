class Clases {
  List<Clase> items = [];
  Clases();

  Clases.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final clase = new Clase.fromJsonMap(item);
      items.add(clase);
    }
  }
}

class Clase {
  String? nombre;
  String? descripcion;
  String? monitor;
  int? capacidad;
  String? ubicacion;

  Clase({
    this.nombre,
    this.descripcion,
    this.capacidad,
    this.monitor,
    this.ubicacion
  });

  Clase.fromJsonMap(Map<String, dynamic> json) {
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    capacidad = json['capacidad'];
    monitor = json['monitor'];
    ubicacion = json['ubicacion'];
  }

 
}
