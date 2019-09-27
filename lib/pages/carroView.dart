import 'package:dropdownjson/FIPE/carro.dart';
import 'package:dropdownjson/FIPE/carroapi.dart';
import 'package:dropdownjson/hello_dropdown_fabricante.dart';
import 'package:dropdownjson/widgets/textstyle.dart';
import 'package:flutter/material.dart';

class CarroView extends StatefulWidget {
  String _tipo;
  String _id;
  String _modelo;
  String _carro;
  CarroView(this._tipo, this._id, this._modelo, this._carro);

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        tooltip: "Home",
        onPressed: () {
          _onClickHome();
        },
        foregroundColor: Colors.purpleAccent,
        backgroundColor: Colors.white,
      ),
    );
  }

  _body() {
    Future<Carro> future = CarroService.getCarro(
        widget._tipo, widget._id, widget._modelo, widget._carro);

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(
            child: Text("Não encontrou dados para retornar!"),
          );
        }
        Carro c = snapshot.data;

        return _cardView(c);
      },
    );
  }

  _cardView(Carro c) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/fundos/detalhes_fundo.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                c.name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                c.veiculo,
                style: TextStyle(color: Colors.white),
              ),
            ),
            _divider(),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              padding: EdgeInsets.only(top: 10),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            // size: 20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Style(
                            msg: "${c.anoModelo}",
                            font: 18,
                            bold: true,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.directions_car,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Style(
                            msg: "${c.marca}",
                            font: 18,
                            bold: true,
                          ),
                        ],
                      ),
                      Column(
                        // coluna valor
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                            color: Colors.white,
                            // size: 20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Style(
                            msg: "${c.preco}",
                            font: 18,
                            bold: true,
                          ),
                        ],
                      ),
                      Column(
                        // combustivel
                        children: <Widget>[
                          Icon(
                            Icons.opacity,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Style(
                            msg: "${c.combustivel}",
                            font: 18,
                            bold: true,
                          )
                        ],
                      )
                    ],
                  ),
                  _divider()
                ],
              ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: <Widget>[
              //     Style(
              //         msg: "Ano : ${c.anoModelo}",
              //         font: 18,
              //         bold: true,
              //         ),
              //     Style(
              //       msg: "Marca : ${c.marca}",
              //       font: 18,
              //       bold: true,
              //     ),
              //     Style(
              //       msg: "Combustivel : ${c.combustivel}",
              //       font: 18,
              //       bold: true,
              //     )
              //   ],
              // ),
            ),
          ],
        ));
  }

  _divider() {
    return Divider(
      color: Colors.white,
      indent: 16,
      endIndent: 16,
      height: 30,
    );
  }

  void _onClickHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HelloDropDownFabricante(),
      ),
    );
  }
}
