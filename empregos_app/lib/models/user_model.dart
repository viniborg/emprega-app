class User {
  final String nome;
  final String email;
  final String cargo;
  final String localizacao;
  final String dataNascimento;
  final String imagemUrl;

  User({
    required this.nome,
    required this.email,
    required this.cargo,
    required this.localizacao,
    required this.dataNascimento,
    required this.imagemUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nome: json['nome'],
      email: json['email'],
      cargo: json['cargo'],
      localizacao: json['localizacao'],
      dataNascimento: json['dataNascimento'],
      imagemUrl: json['imagemUrl'],
    );
  }
}
