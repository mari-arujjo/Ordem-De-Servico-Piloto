class AppUserModel{
  final String id;
  final String nome;
  final String username;
  final String email;
  final String senha;

  AppUserModel({
    required this.id,
    required this.nome,
    required this.username,
    required this.email,
    required this.senha
  });

  factory AppUserModel.fromMap(Map<String, dynamic> map){
    return AppUserModel(
      id: map['id']??'',
      nome: map['nome']??'',
      username: map['username']??'',
      email: map['email']??'',
      senha: map['senha']??'',
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'nome': nome,
      'username': username,
      'email': email,
      'senha': senha
    };
  }
}