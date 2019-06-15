class Curso{
  final int id;
  final String nome;
  final String descricao;


  Curso({this.id,this.nome,this.descricao});

  factory Curso.fromJson(Map<String, dynamic> json) {
    return Curso(
      id: json['id'] as int,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String,

    );
  }
  Map toMap() {
    var map = new Map<String, dynamic>();

    map["nome"] = nome;
    map["descricao"] = descricao;

    return map;
  }

}