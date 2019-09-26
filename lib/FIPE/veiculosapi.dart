import 'package:dropdownjson/FIPE/veiculos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class VeiculoService  {
    
    static Future<List<Veiculo>> getVeiculos(String marca, String id) async {
    try {
      String url = "http://fipeapi.appspot.com/api/1/$marca/veiculos/$id.json";
    print(url);

    final response = await http.get(url);
    final json = response.body;
    final map = convert.json.decode(json);

    List<Veiculo> veiculos = map.map<Veiculo>
      ((json) => Veiculo.fromJson(json)).toList();
    
    //  print("Lista Veiculos: $veiculos");

    return veiculos;  

    } catch (e , exception ) {
      print("Erro : $e Excpt> $exception");
    }
    
  }
}