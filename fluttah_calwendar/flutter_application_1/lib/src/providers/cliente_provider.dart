import 'dart:async';
import 'dart:convert';

import 'package:flutter_application_1/src/models/cliente_model.dart';
import 'package:http/http.dart' as http;

class ClientesProvider {
  String _url = 'my-json-server.typicode.com';
  String _urlPC = '192.168.1.20:8080';

  List<Cliente> _listaClientes = [];

  final _clientesStreamController = StreamController<List<Cliente>>();

  Function(List<Cliente> _listaClientes) get clientesSink =>
      _clientesStreamController.sink.add;

  Stream<List<Cliente>> get clientesStream => _clientesStreamController.stream;

  void disposeStreams() {
    _clientesStreamController.close();
  }

  Future<List<Cliente>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    final clientes = new Clientes.fromJsonList(decodedData);
    return clientes.items;
  }

  Future<List<Cliente>> getClientes() async {
    // para acceder luego con el backend, hay que cargarse toda esa linea y poner solo /reserva
    final url = Uri.http(_urlPC, '/cliente', {});
    final resp = await _procesarRespuesta(url);

    _listaClientes.addAll(resp);
    clientesSink(_listaClientes);
    return resp;
  }
}
