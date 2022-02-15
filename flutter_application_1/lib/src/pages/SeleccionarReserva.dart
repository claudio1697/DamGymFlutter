import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/HomePage.dart';

List<Monitor> _listaMonitores = [
  Monitor("Sergio"),
  Monitor("Sergio"),
  Monitor("Fefo"),
  Monitor("Fefo"),
  Monitor("Claudio"),
  Monitor("Claudio"),
];

List<Reserva> _listaReservas = [
  Reserva("2020-04-04", "20:20", "Sergio"),
  Reserva("1930-04-04", "20:20", "Fefo"),
  Reserva("1778-04-04", "20:20", "Claudio"),
];
/* Reserva("1943-05-01", "22:15"),
  Reserva("1778-05-03", "23:11"),
  Reserva("1778-05-03", "23:11"),
  Reserva("1778-05-03", "23:11"),
  Reserva("1778-05-03", "23:11"), */

class SeleccionarReserva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("lista reservas inicial");
    print(_listaReservas.length);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Realizar Reservas'),
          ),
          body: ListView.builder(
              itemCount: _listaReservas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    print(_listaMonitores[index].nombre!);
                    _borrarReserva(context, _listaReservas[index]);
                  },
                  title: Text(_listaReservas[index].monitor!),
                  subtitle: Text(_listaReservas[index].fecha! +
                      ' ' +
                      _listaReservas[index].hora!),
                  leading: CircleAvatar(
                    child: Text(_listaMonitores[index].nombre!.substring(0, 1)),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              })),
    );
  }

  _borrarReserva(context, Reserva reserva) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Borrar reserva'),
              content: Text('Estas seguro de eliminar la reserva ?' +
                  reserva.fecha! +
                  ' ' +
                  reserva.hora! +
                  '?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Text(
                      "Cancelar",
                    )),
                TextButton(
                    onPressed: () {
                      print(reserva.fecha! + ' ' + reserva.hora!);
                      print('+++++++RESERVAS');
                      print(_listaReservas.length);

                      _listaReservas.remove(reserva);

                      /*   Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SeleccionarReserva())); */

                      // Navigator.pushNamed(context, 'realizarReserva');
                      // Navigator.pop(context);
                      //Navigator.of(context).pop();

                      print('--------RESERVAS');
                      print(_listaReservas.length);
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Text(
                      "Borrar",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }
}

void setState(Null Function() param0) {}

class Reserva {
  String? fecha;
  String? hora;
  String? monitor;

  Reserva(fecha, hora, monitor) {
    this.fecha = fecha;
    this.hora = hora;
    this.monitor = monitor;
  }
}

class Monitor {
  String? nombre;

  Monitor(nombre) {
    this.nombre = nombre;
  }
}
