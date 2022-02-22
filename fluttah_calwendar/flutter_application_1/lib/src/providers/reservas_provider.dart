import 'dart:async';
import 'dart:convert';

import 'package:flutter_application_1/src/models/reserva_model.dart';
import 'package:http/http.dart' as http;

class ReservasProvider {
  String _url = 'my-json-server.typicode.com';
  String _urlPC = '192.168.1.20:8080';

  List<Reserva> _listaReservas = [];

  final _reservasStreamController = StreamController<List<Reserva>>();

  Function(List<Reserva>) get reservasSink =>
      _reservasStreamController.sink.add;

  Stream<List<Reserva>> get reservasStream => _reservasStreamController.stream;

  void disposeStreams() {
    _reservasStreamController.close();
  }

  Future<List<Reserva>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    final reservas = new Reservas.fromJsonList(decodedData);
    return reservas.items;
  }

  Future<List<Reserva>> getReservas() async {
    // para acceder luego con el backend, hay que cargarse toda esa linea y poner solo /reserva
    final url = Uri.http(_urlPC, '/reserva', {});
    final resp = await _procesarRespuesta(url);

    _listaReservas.addAll(resp);
    reservasSink(_listaReservas);
    return resp;
  }

// hay que hacer un delete para borrar los datos desde la api
  /*  Future<List<Reserva>> delete(int id) async {
    // para acceder luego con el backend, hay que cargarse toda esa linea y poner solo /reserva
    final urlFinal = _url + '/claudio1697/DamGymFlutter/reserva/$id';
    final headers = {
      
    };
    final url = http.delete(_url, '', {});
    final resp = await _procesarRespuesta(url);
    _listaReservas.addAll(resp);
    reservasSink(_listaReservas);
    return resp;
  } */
}
