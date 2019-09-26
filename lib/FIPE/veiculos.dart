import 'package:dropdownjson/dropdown.dart';

class Veiculo extends DropDownItem {
  String fipeMarca;
  String name;
  String marca;
  String key;
  String id;
  String fipeName;

  Veiculo(
      {this.fipeMarca,
      this.name,
      this.marca,
      this.key,
      this.id,
      this.fipeName});

  Veiculo.fromJson(Map<String, dynamic> json) {
    fipeMarca = json['fipe_marca'];
    name = json['name'];
    marca = json['marca'];
    key = json['key'];
    id = json['id'];
    fipeName = json['fipe_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fipe_marca'] = this.fipeMarca;
    data['name'] = this.name;
    data['marca'] = this.marca;
    data['key'] = this.key;
    data['id'] = this.id;
    data['fipe_name'] = this.fipeName;
    return data;
  }

    @override
  String toString() {
    return "Veiculos {Id :$id Nome :$name}";
  }

  @override
  String text() {
    return null;
  }

  
  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Veiculos &&
  //     runtimeType == other.runtimeType &&
  //     id == other.id &&
  //     name == other.name;

  // @override
  // int get hashCode => id.hashCode ^ name.hashCode;
}



// class Veiculos extends DropDownItem {
//   String key;
//   int id;
//   String fipeName;
//   String name;

//   Veiculos({this.key, this.id, this.fipeName, this.name});

//   Veiculos.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     id = json['id'];
//     fipeName = json['fipe_name'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = this.key;
//     data['id'] = this.id;
//     data['fipe_name'] = this.fipeName;
//     data['name'] = this.name;
//     return data;
//   }

//   @override
//   String toString() {
//     return "Veiculos {Id :$id Nome :$name}";
//   }

//    @override
//   String text() {
//     return name;
//   }


 
// }
