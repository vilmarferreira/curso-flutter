class CursoMedia{
  final String curso;
  final String descricao;
  final int idCurso;
  final double mediaMinima;
  final double suaMedia;


  CursoMedia({this.curso,this.descricao,this.idCurso,this.mediaMinima,this.suaMedia});

  factory CursoMedia.fromJson(Map<String, dynamic> json) {
    return CursoMedia(
      curso: json['curso'] as String,
      descricao: json['DescricaoCurso'] as String,
      idCurso: json['idCurso'] as int,
      mediaMinima: json['mediaMinimo'] as double,
      suaMedia: json['suaMedia'] as double,

    );
  }
  Map toMap() {
    var map = new Map<String, dynamic>();

    map["curso"] = curso;
    map["DescricaoCurso"] = descricao;
    map["idCurso"] = idCurso;
    map["mediaMinimo"] = mediaMinima;
    map["suaMedia"] = suaMedia;

    return map;
  }

}