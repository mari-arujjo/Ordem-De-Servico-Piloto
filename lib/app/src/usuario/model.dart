// ignore_for_file: non_constant_identifier_names

class ModelTeste {
  final int id_usuario;
  final String usuario;
  final String nome;
  final int nivel_acesso;
  final String? senha;

  ModelTeste({
    required this.id_usuario,
    required this.usuario,
    required this.nome,
    required this.nivel_acesso,
    this.senha,
  });

  // vai retonrar um mapa que a key=string e value=dynamic(int, string, float etc)
  factory ModelTeste.fromMap(Map<String, dynamic> map) {
    return ModelTeste(
      id_usuario: map['id_usuario'],
      usuario: map['usuario'],
      nome: map['nome'],
      nivel_acesso: map['nivel_acesso'],
      senha: map['senha']
    );
  }
}
