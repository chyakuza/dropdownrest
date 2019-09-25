import 'package:dropdownjson/FIPE/marcas.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class MarcasService  {
    static Future<List<Marcas>> getMarcas(String marca) async {
    
    String url = "http://fipeapi.appspot.com/api/1/$marca/marcas.json";
    print(url);

    final response = await http.get(url);
    final json = response.body;
    final map = convert.json.decode(json);

    List<Marcas> marcas = map.map<Marcas>
      ((json) => Marcas.fromJson(json)).toList();
    
    // print("Marcas Services: $marcas");

    return marcas;    
  }
}