import 'package:dropdownjson/FIPE/modeloano.dart';
import 'package:dropdownjson/FIPE/veiculos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class ModeloAnoService  {
    
    static Future<List<ModeloAno>> getModeloAno(String marca, String id, String idModelo) async {
    try {
      String url = "http://fipeapi.appspot.com/api/1/$marca/veiculo/$id/$idModelo.json";
    print(url);

    final response = await http.get(url);
    final json = response.body;
    final map = convert.json.decode(json);

    List<ModeloAno> modelosAno = map.map<ModeloAno>
      ((json) => ModeloAno.fromJson(json)).toList();
    
    //  print("Lista Veiculos: $veiculos");

    return modelosAno; 
    print("Retorno modelos: $modelosAno"); 

    } catch (e , exception ) {
      print("Erro : $e Excpt> $exception");
    }
    
  }
}