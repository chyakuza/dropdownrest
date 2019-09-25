import 'package:dropdownjson/FIPE/veiculos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class VeiculoService  {
    
    static Future<List<Veiculos>> getVeiculos(String marca, int id) async {
    try {
      String url = "http://fipeapi.appspot.com/api/1/$marca/veiculos/$id.json";
    print(url);

    final response = await http.get(url);
    final json = response.body;
    final map = convert.json.decode(json);

    List<Veiculos> marcas = map.map<Veiculos>
      ((json) => Veiculos.fromJson(json)).toList();
    
    // print("Marcas Services: $marcas");

    return marcas;    
    } catch (e , exception ) {
      print("Erro : $e Excpt> $exception");
      throw e;
      
    }
    
  }
}