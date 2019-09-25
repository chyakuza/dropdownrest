import 'dart:async';
import 'dart:ui';

import 'package:dropdownjson/FIPE/marcaapi.dart';
import 'package:dropdownjson/FIPE/marcas.dart';
import 'package:dropdownjson/FIPE/veiculos.dart';
import 'package:dropdownjson/FIPE/veiculosapi.dart';
import 'package:dropdownjson/fabricante.dart';
import 'package:flutter/material.dart';

import 'dropdown.dart';

class HelloDropDownFabricante extends StatefulWidget {
  @override
  _HelloDropDownFabricanteState createState() =>
      _HelloDropDownFabricanteState();
}

class _HelloDropDownFabricanteState extends State<HelloDropDownFabricante> {
  final _streamController = StreamController<int>();
  Fabricante fabricante;
  Marcas marca;
  Veiculos veiculo;
  var veiculoId = 0;
  var _tipo = ["carros", "motos", "caminhoes"];

  var _itemSelecionado = "carros";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabela FIPE-Flutter"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _comboTipo(),
          SizedBox(
            height: 20,
          ),
          _comboMarcas(),
          SizedBox(
            height: 20,
          ),
          _comboVeiculos(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void _onMarcaChanged(Marcas m) {
    setState(() {
      this.marca = m;
      _loadVeiculos();
      
      print("Selecionou $m");
    });
  }

  void _onVeiculoChanged(Veiculos v) {
    setState(() {
      
      this.veiculo = v;
      this.veiculoId = v.id;
      print("Veiculo $v");
    });
  }

  _loadVeiculos() async {
    List<Veiculos> veiculo =
        await VeiculoService.getVeiculos(_itemSelecionado, veiculoId);
        
        _streamController.add(m.id);
  }

  _comboTipo() {
    return DropdownButton<String>(
      items: _tipo.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
            value: dropDownStringItem,
            child: Container(
              child: Text(dropDownStringItem),
            ));
      }).toList(),
      onChanged: (String newValueSelected) {
        setState(() {
          this._itemSelecionado = newValueSelected;
        });
      },
      value: _itemSelecionado,
    );
  }

  _comboMarcas() {
    Future<List<Marcas>> future = MarcasService.getMarcas(_itemSelecionado);
    return FutureBuilder<List<Marcas>>(
      // initialData: [],
      future: future,
      builder: (context, snapshot) {
        // print("$snapshot.data");
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        List<Marcas> listaMarcas = snapshot.data;
        // print("Lista $listaMarcas");
        return DropDown<Marcas>(listaMarcas, "Marcas", marca, _onMarcaChanged);
      },
    );
  }

  _comboVeiculos() {
    return StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          // print("$snapshot.data");
          if (snapshot.hasError) {
            return Center(
              child: Text("Não foi possivel carregar os dados do veiculo"),
            );
          }
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          List<Veiculos> listaMarcas = snapshot.data;
          // print("Lista $listaMarcas");

          return DropDown<Veiculos>(
              listaMarcas, "Marcas", veiculo, _onVeiculoChanged);
        });
  }
}
