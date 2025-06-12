import 'package:ordem_de_servico/app/src/models/usuario_model.dart';

class GestaoUsuariosController {
  List<Usuario> allUsers = [];

  GestaoUsuariosController(){
    allUsers = [
      Usuario(
        id_usuario: 1,
        usuario: 'mari',
        nome: 'Mariana Araújo Silva',
        nivel_acesso: 1
      ),
      Usuario(
        id_usuario: 3,
        usuario: 'luyz',
        nome: 'Luyz Henryk Duarte de Medeiros',
        nivel_acesso: 1
      ),
      Usuario(
        id_usuario: 5,
        usuario: 'vitinho',
        nome: 'Victor Gabriel Revorêdo Sobral',
        nivel_acesso: 2
      ),
      Usuario(
        id_usuario: 6,
        usuario: 'jao.gabrel',
        nome: 'João Gabriel Araújo Silva',
        nivel_acesso: 3
      ),
      Usuario(
        id_usuario: 7,
        usuario: 'karen',
        nome: 'Karen Helloisa Araújo',
        nivel_acesso: 3
      ),
      Usuario(
        id_usuario: 9,
        usuario: 'leticia',
        nome: 'Letícia Alves de Araújo',
        nivel_acesso: 2
      ),
      Usuario(
        id_usuario: 9,
        usuario: 'leticia',
        nome: 'Letícia Alves de Araújo',
        nivel_acesso: 2
      ),
      Usuario(
        id_usuario: 9,
        usuario: 'leticia',
        nome: 'Letícia Alves de Araújo',
        nivel_acesso: 2
      ),
      Usuario(
        id_usuario: 9,
        usuario: 'leticia',
        nome: 'Letícia Alves de Araújo',
        nivel_acesso: 2
      ),
    ];
  }
}