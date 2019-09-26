import 'package:dropdownjson/FIPE/marcas.dart';
import 'package:dropdownjson/FIPE/veiculos.dart';

import 'package:dropdownjson/fabricante.dart';
import 'package:dropdownjson/pages/marcas_listview.dart';
import 'package:dropdownjson/pages/veiculos_page.dart';
import 'package:flutter/material.dart';

class HelloDropDownFabricante extends StatefulWidget {
  @override
  _HelloDropDownFabricanteState createState() =>
      _HelloDropDownFabricanteState();
}

class _HelloDropDownFabricanteState extends State<HelloDropDownFabricante> {
  Fabricante fabricante;
  Marcas marca;
  Veiculo veiculo;
  var veiculoId = '';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Selecione o tipo ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _comboTipo(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[100],
            height: MediaQuery.of(context).size.height - 230,
            child: MarcasListViews(_itemSelecionado),
          ),
        ],
      ),
    );
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

  void _onMarcaChanged(Marcas m) {
    print("Clicou em  $m");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                VeiculosPage(_itemSelecionado, m.id.toString())));
  }
}

// LIXOS
// _comboMarcas() {
//   Future<List<Marcas>> future = MarcasService.getMarcas(_itemSelecionado);
//   return FutureBuilder<List<Marcas>>(
//     // initialData: [],
//     future: future,
//     builder: (context, snapshot) {
//       // print("$snapshot.data");
//       if (!snapshot.hasData) {
//         return CircularProgressIndicator();
//       }
//       List<Marcas> listaMarcas = snapshot.data;
//       // print("Lista $listaMarcas");
//       return DropDown<Marcas>(listaMarcas, "Marcas", marca, _onMarcaChanged);
//     },
//   );
// }
