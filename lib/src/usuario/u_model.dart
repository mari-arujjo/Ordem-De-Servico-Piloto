// ignore_for_file: non_constant_identifier_names

class UsuarioModel {
  final int id_usuario;
  final String usuario;
  final String nome;
  final int nivel_acesso;
  final String? senha;
  final String? foto_url;

  UsuarioModel({
    required this.id_usuario,
    required this.usuario,
    required this.nome,
    required this.nivel_acesso,
    required this.senha,
    required this.foto_url
  });

  // vai retonrar um mapa que a key=string e value=dynamic(int, string, float etc)
  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id_usuario: map['id_usuario'],
      usuario: map['usuario'],
      nome: map['nome'],
      nivel_acesso: map['nivel_acesso'],
      senha: map['senha'],
      foto_url: map['foto_url'],
    );
  }
}
