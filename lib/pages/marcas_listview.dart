import 'package:dropdownjson/FIPE/marcaapi.dart';
import 'package:dropdownjson/FIPE/marcas.dart';
import 'package:dropdownjson/pages/veiculos_page.dart';
import 'package:flutter/material.dart';

class MarcasListViews extends StatefulWidget {
  String tipo;

  MarcasListViews(this.tipo);

  @override
  _MarcasListViewsState createState() => _MarcasListViewsState();
}

class _MarcasListViewsState extends State<MarcasListViews> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    Future<List<Marcas>> future = MarcasService.getMarcas(widget.tipo);

    return FutureBuilder(
      future: future,
      // initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasError){
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Marcas> marcas = snapshot.data;
        // print("Marcas :> $marcas");
        return _listViewMarcas(marcas);
      },
    );
  }

  _listViewMarcas(List<Marcas> marcas) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: marcas.length,
        itemBuilder: (context, idx) {
          Marcas m = marcas[idx];
          return Card(
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text(m.name, style: TextStyle(fontSize: 20)),
                  trailing: Icon(Icons.zoom_in),
                  onTap: () {
                    // print("Clicou em : " + m.id.toString());
                    _onChangeVeiculos(widget.tipo, m.id.toString());
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _onChangeVeiculos(String tipo, String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VeiculosPage(tipo, id),
      ),
    );
  }
}
