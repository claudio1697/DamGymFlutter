import 'dart:async';
import 'dart:convert';

import 'package:flutter_application_1/src/models/clase_model.dart';
import 'package:http/http.dart' as http;

class ClaseProvider {
  String _url = 'my-json-server.typicode.com';
  String _urlPC = '192.168.1.20:8080';

  List<Clase> _listaClases = [];

  final _clasesStreamController = StreamController<List<Clase>>();

  Function(List<Clase>) get clasesSink =>
      _clasesStreamController.sink.add;

  Stream<List<Clase>> get clasesStream => _clasesStreamController.stream;

  void disposeStreams() {
    _clasesStreamController.close();
  }

  Future<List<Clase>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    final clases = new Clases.fromJsonList(decodedData);
    return clases.items;
  }

  Future<List<Clase>> getClases() async {
    // para acceder luego con el backend, hay que cargarse toda esa linea y poner solo /reserva
    final url = Uri.http(_urlPC, '/clase', {});
    final resp = await _procesarRespuesta(url);

    _listaClases.addAll(resp);
    clasesSink(_listaClases);
    return resp;
  }
}
