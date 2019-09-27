import 'dart:async';

import 'package:dropdownjson/hello_dropdown_fabricante.dart';
import 'package:flutter/material.dart';

class SplashPerson extends StatefulWidget {
  _SplashPersonState createState() => _SplashPersonState();
}

class _SplashPersonState extends State<SplashPerson> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => _onChangeHome());
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/fundos/detalhes_fundo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Icon(Icons.toys,
                          color: Colors.purple[400], size: 50.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Text("TABELA FIPE ",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Center(
                    child: Text(
                      "Carlos Henrique \n  For Flutter",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  _onChangeHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HelloDropDownFabricante(),
      ),
    );
  }
}
