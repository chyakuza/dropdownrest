import 'package:dropdownjson/FIPE/carro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CarroService {
  static Future<Carro> getCarro(
      String marca, String id, String idModelo, String carroId) async {
    try {
      String url =
          "http://fipeapi.appspot.com/api/1/$marca/veiculo/$id/$idModelo/$carroId.json";
      print(url);

      final response = await http.get(url);
      final json = response.body;
      final Map<String, dynamic> mapResponse = convert.json.decode(json);

      if (response.statusCode == 200) {
        Carro carro = Carro.fromJson(mapResponse);

        print(mapResponse);
        return carro;
      }
    } catch (e, exception) {
      print("Erro : $e Excpt> $exception");
    }
  }
}
