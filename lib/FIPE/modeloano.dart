class ModeloAno {
  String fipeMarca;
  String fipeCodigo;
  String name;
  String marca;
  String key;
  String veiculo;
  String id;

  ModeloAno(
      {this.fipeMarca,
      this.fipeCodigo,
      this.name,
      this.marca,
      this.key,
      this.veiculo,
      this.id});

  ModeloAno.fromJson(Map<String, dynamic> json) {
    fipeMarca = json['fipe_marca'];
    fipeCodigo = json['fipe_codigo'];
    name = json['name'];
    marca = json['marca'];
    key = json['key'];
    veiculo = json['veiculo'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fipe_marca'] = this.fipeMarca;
    data['fipe_codigo'] = this.fipeCodigo;
    data['name'] = this.name;
    data['marca'] = this.marca;
    data['key'] = this.key;
    data['veiculo'] = this.veiculo;
    data['id'] = this.id;
    return data;
  }
}