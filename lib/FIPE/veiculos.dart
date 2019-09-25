import 'package:dropdownjson/dropdown.dart';

class Veiculos extends DropDownItem {
  String key;
  int id;
  String fipeName;
  String name;

  Veiculos({this.key, this.id, this.fipeName, this.name});

  Veiculos.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    id = json['id'];
    fipeName = json['fipe_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['id'] = this.id;
    data['fipe_name'] = this.fipeName;
    data['name'] = this.name;
    return data;
  }

  @override
  String toString() {
    return "Marcas {Id :$id Nome :$name}";
  }

   @override
  String text() {
    return name;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Veiculos &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

 
}
