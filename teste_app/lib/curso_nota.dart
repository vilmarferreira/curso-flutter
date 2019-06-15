class CursoMedia{
  final String curso;
  final int idCurso;
  final double mediaMinima;
  final double suaMedia;


  CursoMedia({this.curso,this.idCurso,this.mediaMinima,this.suaMedia});

  factory CursoMedia.fromJson(Map<String, dynamic> json) {
    return CursoMedia(
      curso: json['curso'] as String,
      idCurso: json['idCurso'] as int,
      mediaMinima: json['mediaMinima'] as double,
      suaMedia: json['suaMedia'] as double,

    );
  }
  Map toMap() {
    var map = new Map<String, dynamic>();

    map["curso"] = curso;
    map["idCurso"] = idCurso;
    map["mediaMinima"] = mediaMinima;
    map["suaMedia"] = suaMedia;

    return map;
  }

}