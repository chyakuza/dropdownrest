import 'package:dropdownjson/pages/splash.dart';
import 'package:dropdownjson/widgets/theme_purple.dart';
import 'package:flutter/material.dart';
import 'hello_dropdown_fabricante.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myThemePurple,
      home: SplashPerson(),//HelloDropDownFabricante(),
    );
  }
}
