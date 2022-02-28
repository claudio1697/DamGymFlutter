import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/HomePage.dart';
import 'package:flutter_application_1/src/models/reserva_model.dart';
import 'package:flutter_application_1/src/providers/reservas_provider.dart';

List<Monitor> _listaMonitores = [
  Monitor("Pepe"),
  Monitor("Roberto"),
  Monitor("Carmen"),
];

List<dynamic> _listaReservas = [];

class SeleccionarReserva extends StatefulWidget {
  @override
  State<SeleccionarReserva> createState() => _SeleccionarReservaState();
}

class _SeleccionarReservaState extends State<SeleccionarReserva> {
  final ReservasProvider reservasProvider = new ReservasProvider();

  @override
  Widget build(BuildContext context) {
    reservasProvider.getReservas();
    print("lista reservas inicial");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 70, 66, 66),
          title: Text('Realizar Reservas'),
        ),
        body: FutureBuilder(
            future: reservasProvider.getReservas(),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                _listaReservas = snapshot.data!;
                return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    //itemCOUNT -> aqui va el numero de reservas qyue se mostrarán por pantalla
                    // hay que hacer un .length para que coja todas las que le pasamos
                    //si ponemos 3 va bien, mas explota
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 14,
                                spreadRadius: 10,
                                offset: Offset(10, 10))
                          ]),
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.red[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                            child: ListTile(
                              leading: FadeInImage(
                                  //esta img es el icono a la izquierda de los textos
                                  image: AssetImage('assets/profile_img.jpg'),
                                  placeholder:
                                      AssetImage('assets/profile_img.jpg'),
                                  width: 50.0,
                                  fit: BoxFit.contain),
                              onLongPress: () {
                                print(_listaMonitores[index].nombre!);
                                print('hola ');
                                _borrarReserva(context, _listaReservas[index]);
                              },
                              title: Text(
                                  'Monitor: ' + _listaMonitores[index].nombre!),
                              subtitle: Text('Fecha: ' +
                                  snapshot.data![index].fecha! +
                                  '\nHora: ' +
                                  snapshot.data![index].hora! +
                                  '\nClase: ' + snapshot.data![index].clase!),
                              //trailing es el icono de la derecha del todo de cada lista
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ));
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  void _update() {
    setState(() {});
    print("borra");
  }

  _borrarReserva(context, reserva) {
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
                      Navigator.of(context, rootNavigator: true).pop();
                      _update();
                      /*   Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SeleccionarReserva())); */

                      // Navigator.pushNamed(context, 'realizarReserva');
                      // Navigator.pop(context);
                      //Navigator.of(context).pop();

                      print('--------RESERVAS');
                      print(_listaReservas.length);
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
  // String? monitor;

  Reserva(fecha, hora) {
    this.fecha = fecha;
    this.hora = hora;
  }
}

class Monitor {
  String? nombre;

  Monitor(nombre) {
    this.nombre = nombre;
  }
}
