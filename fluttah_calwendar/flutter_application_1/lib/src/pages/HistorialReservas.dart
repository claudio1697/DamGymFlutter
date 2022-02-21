import 'package:flutter/material.dart';

class HistorialReservas extends StatefulWidget {
  @override
  State<HistorialReservas> createState() => _verHistorialReservas();
}

int _seleccionarBoton = 0;

class _verHistorialReservas extends State<HistorialReservas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 70, 66, 66),
            title: Text('HISTORIAL DE RESERVAS'),
          ),
          body: SafeArea(
              child: Column(
            children: [
              Divider(),
              Center(
                child: Stack(
                  children: <Widget>[
                    Text(
                      "RESERVAS PENDIENTES",
                      style: TextStyle(
                        fontSize: 20,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      "RESERVAS PENDIENTES",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  print("IMAGEN 1");
                },
                child: ClipRRect(
                  child: Image.asset(
                    'lib/src/img/imgPantallaInicial.jpg',
                    width: 400,
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Divider(),
              Center(
                child: Stack(
                  children: <Widget>[
                    Text(
                      "RESERVAS FINALIZADAS",
                      style: TextStyle(
                        fontSize: 20,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      "RESERVAS FINALIZADAS",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  print("IMAGEN 2");
                },
                child: ClipRRect(
                  child: Image.asset(
                    'lib/src/img/imgPantallaInicial.jpg',
                    width: 400,
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ],
          )),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back_ios_outlined),
                label: 'Volver Calendario',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fingerprint),
                label: 'HISTORIAL RESERVAS',
              ),
            ],
            currentIndex: 1,
            selectedItemColor: Colors.amber[800],
            onTap: controlarBotones,
          ),
        ));
  }

// FUNCION PARA CONTROLAR LOS BOTONES
  void controlarBotones(int index) {
    setState(() {
      _seleccionarBoton = index;

      if (_seleccionarBoton == 0) {
        Navigator.pushNamed(context, 'calendarioPantalla');
      }

      if (_seleccionarBoton == 1) {
        print("BOTON 2");
      }

      /* if (_seleccionarBoton == 0) {
        Navigator.pushNamed(context, 'realizarReserva');
      }

      if (_seleccionarBoton == 1) {
        Navigator.pushNamed(context, 'historialReservas');
      } */
    });
  }
}
