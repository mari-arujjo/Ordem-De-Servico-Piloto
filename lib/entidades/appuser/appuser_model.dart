class AppUserModel{
  final String id;
  final String nome;
  final String username;
  final String email;
  final String? senha;
  final String token;

  AppUserModel({
    required this.id,
    required this.nome,
    required this.username,
    required this.email,
    this.senha,
    required this.token
  });


  // vai retonrar um mapa que a key=string e value=dynamic(int, string, float etc)
  // PARA RECEBER
  factory AppUserModel.fromMap(Map<String, dynamic> map){
    return AppUserModel(
      id: map['id']??'',
      nome: map['nome']??'',
      username: map['username']??'',
      senha: map['senha']??'',
      email: map['email']??'',
      token: map['token']??''
    );
  }

  
  //PARA ENVIAR
  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'nome': nome,
      'username': username,
      'email': email,
      'senha': senha,
      'token': token
    };
  }

}