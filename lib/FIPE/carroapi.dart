import 'package:dropdownjson/FIPE/carro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class CarroService  {
    static Future<List<Carro>> getCarro(String marca, String id, String idModelo, String carroId) async {
    try {
      String url = "http://fipeapi.appspot.com/api/1/$marca/veiculo/$id/$idModelo/$carroId.json";
    print(url);

    final response = await http.get(url);
    final json = response.body;
    final map = convert.json.decode(json);

    List<Carro> carro = map.map<Carro>
      ((json) => Carro.fromJson(json)).toList();
    //  print("Lista Veiculos: $veiculos");
    return carro;    

    } catch (e , exception ) {
      print("Erro : $e Excpt> $exception");
    }
    
  }
}