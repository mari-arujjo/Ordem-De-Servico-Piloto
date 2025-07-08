// ignore_for_file: non_constant_identifier_names

class UsuarioModel {
  final int id_usuario;
  final String usuario;
  final String nome;
  final int nivel_acesso;
  final String senha;
  final String? foto_url;

  UsuarioModel({
    required this.id_usuario,
    required this.usuario,
    required this.nome,
    required this.nivel_acesso,
    required this.senha,
    this.foto_url
  });

  // vai retonrar um mapa que a key=string e value=dynamic(int, string, float etc)
  // PARA RECEBER
  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id_usuario: map['id_usuario'] ?? 0,
      usuario: map['usuario'] ?? '',
      nome: map['nome'] ?? '',
      nivel_acesso: map['nivel_acesso'] ?? 3, // padrão mais seguro
      senha: map['senha'],
      foto_url: map['foto_url'],
    );
  }

  // PARA ENVIAR
  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id_usuario,
      'usuario': usuario,
      'nome': nome,
      'nivel_acesso': nivel_acesso,
      'senha': senha,
      'foto_url': foto_url,
    };
  }
}
