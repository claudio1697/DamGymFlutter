import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/calendar/calendar_timeline.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

class calen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<calen> {
  late DateTime _selectedDate;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, 'realizarReserva');
      }

      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, 'historialReservas');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333A47),
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Calendario DamGym',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.tealAccent[100]),
          )),
      body: SafeArea(
        child: Column(
          //CON ESTE CROSS CAMBIAMOS EL ORDEN DE LOS WIDGETS AL CENTRO
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
            ),
            CalendarTimeline(
              showYears: true,
              initialDate: _selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date!;
                });
              },
              leftMargin: 20,
              monthColor: Colors.white70,
              dayColor: Colors.teal[200],
              dayNameColor: Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal[200])),
                child: Text('VOLVER DÍA/FECHA/HORA ACTUAL',
                    style: TextStyle(color: Color(0xFF233A47))),
                onPressed: () => setState(() => _resetSelectedDate()),
              ),
            ),
            SizedBox(height: 0),
            Center(
                child: Text(
              'Fecha seleccionada: $_selectedDate',
              style: TextStyle(color: Colors.white),
            )),
            SizedBox(height: 31),
            _swiper(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'RESERVAR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms),
            label: 'HISTORIAL RESERVAS',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _swiper() {
    List<String> imagenes = [
      "https://i.pinimg.com/564x/32/d4/a3/32d4a335734fb100b262a9718164b71e.jpg",
      "https://thumbs.dreamstime.com/b/pilates-gimnasia-pr%C3%A1ctica-icono-del-ejercicio-ejemplo-vector-muestra-negra-en-fondo-aislado-102025243.jpg",
      "https://ofertasbicicletas.com/wp-content/plugins/aawp/public/image.php?url=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNDFmenZXSDcwRkwucG5nLnBuZw=",
    ];

    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 300.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            imagenes[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: imagenes.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
