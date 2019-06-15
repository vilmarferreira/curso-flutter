class Pessoa{
  final int id;
  String nome;
  final String cpf;
  final String rg;
  final String sexo;


  Pessoa({this.id,this.nome,this.cpf, this.rg, this.sexo});

  factory Pessoa.fromJson(Map<String, dynamic> json) {
    return Pessoa(
      id: json['id'] as int,
      nome: json['nome'] as String,
      cpf: json['cpf'] as String,
      rg: json['rg'] as String,
      sexo: json['sexo'] as String,

    );
  }
  Map toMap() {
    var map = new Map<String, dynamic>();

    map["nome"] = nome;
    map["cpf"] = cpf;
    map["rg"] = rg;
    map["sexo"] = sexo;

    return map;
  }

}