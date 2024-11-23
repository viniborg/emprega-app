class QualificationModel {
  final String titulo;
  final String descricao;
  final String nivel;
  final String area;
  final String imagemUrl;

  QualificationModel({
    required this.titulo,
    required this.descricao,
    required this.nivel,
    required this.area,
    required this.imagemUrl,
  });

  factory QualificationModel.fromJson(Map<String, dynamic> json) {
    return QualificationModel(
      titulo: json['titulo'],
      descricao: json['descricao'],
      nivel: json['nivel'],
      area: json['area'],
      imagemUrl: json['imagemUrl'],
    );
  }
}
