class JobModel {
  final String titulo;
  final String empresa;
  final String localizacao;
  final String tipo;
  final String descricao;
  final String image;
  final String area;

  JobModel({
    required this.titulo,
    required this.empresa,
    required this.localizacao,
    required this.tipo,
    required this.descricao,
    required this.image,
    required this.area
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      titulo: json['titulo'],
      empresa: json['empresa'],
      localizacao: json['localizacao'],
      tipo: json['tipo'],
      descricao: json['descricao'],
      image: json['image'],
      area: json['area'],
    );
  }
}
