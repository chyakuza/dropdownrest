import 'package:flutter/material.dart';
import 'package:dropdownjson/hello_dropdown_page1.dart';
import 'package:dropdownjson/hello_dropdown_page2.dart';

import 'hello_dropdown_fabricante.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HelloDropDownFabricante(),
    );
  }
}
