import 'dart:async';

import 'package:dropdownjson/FIPE/veiculos.dart';
import 'package:dropdownjson/FIPE/veiculosapi.dart';
import 'package:flutter/material.dart';

class VeiculosPage extends StatefulWidget {
  String _tipo;
  String _veiculoId;

  VeiculosPage(this._tipo, this._veiculoId);

  @override
  _VeiculosPageState createState() => _VeiculosPageState();
}

class _VeiculosPageState extends State<VeiculosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veiculos"),
      ),
      body: _body(),
    );
  }

  _body() {
    Future<List<Veiculo>> future =
        VeiculoService.getVeiculos(this.widget._tipo, this.widget._veiculoId);

    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Veiculo> veiculos = snapshot.data;
          return _listaVeiculos(veiculos);
        });
  }

  _listaVeiculos(List<Veiculo> veiculos) {
    return ListView.builder(
        itemCount: veiculos.length ?? 0,
        itemBuilder: (context, idx) {
          Veiculo v = veiculos[idx];
          return Card(
            color: Colors.grey[100],
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(v.name),
                  trailing: Icon(Icons.zoom_in),
                  onTap: () {
                    print("Clicou em : {$v.id}");
                  },
                ),
              ],
            ),
          );
        });
  }
}
