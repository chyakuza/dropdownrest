import 'dart:ui';

import 'package:dropdownjson/FIPE/marcaapi.dart';
import 'package:dropdownjson/FIPE/marcas.dart';
import 'package:dropdownjson/fabricante.dart';
import 'package:flutter/material.dart';

import 'dropdown.dart';

class HelloDropDownFabricante extends StatefulWidget {
  @override
  _HelloDropDownFabricanteState createState() =>
      _HelloDropDownFabricanteState();
}

class _HelloDropDownFabricanteState extends State<HelloDropDownFabricante> {
  Fabricante fabricante;
  Marcas marca;
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
          _comboMarcas(),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Marcas>>(
            initialData: [],
            future: MarcasService.getMarcas(_itemSelecionado),
            builder: (context, snapshot) {
              // print("$snapshot.data");
              List<Marcas> listaMarcas = snapshot.data;
              return DropDown<Marcas>(
                  listaMarcas, "Marcas", marca, _onMarcaChanged);
            },
          ),
          SizedBox(
            height: 20,
          ),
          // FutureBuilder<List<Fabricante>>(
          //     initialData: [],
          //     future: FabricanteService.getFabricantes(_itemSelecionado),
          //     builder: (context, snapshot) {
          //       List<Fabricante> lista = snapshot.data;

          //       return DropDown<Fabricante>(
          //           lista, "Fabricantes", fabricante, _onFabricanteChanged);
          //     }),
          Text(
            fabricante != null ? "Fabricante > ${fabricante.nome}" : "",
            style: TextStyle(color: Colors.black, fontSize: 30),
          )
        ],
      ),
    );
  }

  void _onMarcaChanged(Marcas m) {
    setState(() {
      this.marca = m;
      print("Selecionou $m");
    });
  }

  void _onFabricanteChanged(Fabricante f) {
    print("> ${f.nome} > ${f.id}");

    setState(() {
      this.fabricante = f;
    });
  }

  _comboMarcas() {
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
}
