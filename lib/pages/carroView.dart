import 'package:dropdownjson/FIPE/carro.dart';
import 'package:dropdownjson/FIPE/carroapi.dart';
import 'package:flutter/material.dart';

class CarroView extends StatefulWidget {
  String _tipo;
  String _id;
  String _modelo;
  String _carro;
  CarroView(this._tipo, this._id,this._modelo, this._carro);

  @override
  _CarroViewState createState() => _CarroViewState();
}

class _CarroViewState extends State<CarroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabela FIPE - Flutter "),
      ),
      body: _body(),
    );
  }

  _body() {
    Future<List<Carro>> future = CarroService.getCarro(widget._tipo, widget._id, widget._modelo, widget._carro);

    return FutureBuilder(
      future: future,      
      builder: ( context,  snapshot) {
        if(snapshot.hasError){
          return Center(child: CircularProgressIndicator());
        }
        if(!snapshot.hasData){
          return Center(child: Text("Não encontrou dados para retornar!"),);
        }
        List<Carro> c = snapshot.data;

        return  _cardView(c);
      },
    );
  }

  _cardView(List<Carro> c) {

    return Container(
      child: ListView.builder(
        itemCount: c.length ,
        itemBuilder: (context, idx){
          Carro carro = c[idx];
          return ListTile(
            title:Text(carro.name, style: TextStyle(fontSize: 20),),
            subtitle: Text(carro.veiculo),
          );
        }
      ),

    );
  }
}
