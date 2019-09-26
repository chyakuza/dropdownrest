class Carro {
  String referencia;
  String fipeCodigo;
  String name;
  String combustivel;
  String marca;
  String anoModelo;
  String preco;
  String key;
  double time;
  String veiculo;
  String id;

  Carro(
      {this.referencia,
      this.fipeCodigo,
      this.name,
      this.combustivel,
      this.marca,
      this.anoModelo,
      this.preco,
      this.key,
      this.time,
      this.veiculo,
      this.id});

  Carro.fromJson(Map<String, dynamic> json) {
    referencia = json['referencia'];
    fipeCodigo = json['fipe_codigo'];
    name = json['name'];
    combustivel = json['combustivel'];
    marca = json['marca'];
    anoModelo = json['ano_modelo'];
    preco = json['preco'];
    key = json['key'];
    time = json['time'];
    veiculo = json['veiculo'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referencia'] = this.referencia;
    data['fipe_codigo'] = this.fipeCodigo;
    data['name'] = this.name;
    data['combustivel'] = this.combustivel;
    data['marca'] = this.marca;
    data['ano_modelo'] = this.anoModelo;
    data['preco'] = this.preco;
    data['key'] = this.key;
    data['time'] = this.time;
    data['veiculo'] = this.veiculo;
    data['id'] = this.id;
    return data;
  }
}