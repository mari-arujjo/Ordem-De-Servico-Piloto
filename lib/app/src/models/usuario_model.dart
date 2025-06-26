// ignore_for_file: non_constant_identifier_names

class Usuario{
  int id_usuario;
  String usuario;
  String nome;
  int nivel_acesso;
  String senha;
  String foto;

  Usuario({
    this.id_usuario =0,
    this.usuario ="",
    this.nome="",
    this.nivel_acesso=0,
    this.senha="",
    this.foto = "lib/app/assets/imgs/semFoto.png",
  });

  factory Usuario.fromJson(Map<String, dynamic> json){
    return Usuario(
      id_usuario: json['id_usuario'],
      usuario: json['usuario'],
      nome: json['nome'],
      nivel_acesso: json['nivel_acesso'],
      ///senha: json['senha'],
      foto: "lib/app/assets/imgs/semFoto.png"
    );
  }
}