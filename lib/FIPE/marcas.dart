import 'package:dropdownjson/dropdown.dart';

class Marcas extends DropDownItem{
  String key;
  int id;
  String fipeName;
  String name;

  Marcas({this.key, this.id, this.fipeName, this.name});

  Marcas.fromJson(Map<String, dynamic> json) {
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
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Marcas &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode;

  @override
  String text() {
    // TODO: implement text
    return null;
  }
}
  
