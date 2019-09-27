import 'package:dropdownjson/FIPE/modeloano.dart';
import 'package:dropdownjson/FIPE/modeloanoapi.dart';
import 'package:dropdownjson/pages/carroView.dart';
import 'package:flutter/material.dart';

class ModeloAnoVeiculo extends StatefulWidget {
  String _tipo;
  String _id;
  String _mod;
  ModeloAnoVeiculo(this._tipo, this._id, this._mod);

  @override
  _ModeloAnoVeiculoState createState() => _ModeloAnoVeiculoState();
}

class _ModeloAnoVeiculoState extends State<ModeloAnoVeiculo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modelos - TABELA FIPE"),
      ),
      body: _body(),
    );
  }

  _body() {
    Future<List<ModeloAno>> future =
        ModeloAnoService.getModeloAno(widget._tipo, widget._id, widget._mod);

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: Text("Sem dados para consulta"),
          );
        }
        List<ModeloAno> modeloAno = snapshot.data;

        return _listViewModeloAno(modeloAno, widget._tipo,widget._id,widget._mod);
      },
    );
  }

  _listViewModeloAno(List<ModeloAno> modeloAno, String t, String i , String m) {
    return Card(
      color: Colors.white,
      child: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          itemCount: modeloAno.length,
          itemBuilder: (context, idx) {
            ModeloAno c = modeloAno[idx];
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    c.veiculo,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Marca: ${c.marca}  Ano: ${c.name.replaceAll("Gasolina", "")}"),
                  trailing: Icon(Icons.zoom_in),
                  onTap: () {
                    _onClickCarro(t, i , m , c.id.toString());
                    print("Clicou em " + c.id);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onClickCarro(String t , String i, String m, String c) {
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarroView(t, i, m, c),
      ),
    );
  }
}
