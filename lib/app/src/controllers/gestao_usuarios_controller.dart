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
      // Novos usuários
    Usuario(
      id_usuario: 10,
      usuario: 'ricardo',
      nome: 'Ricardo José da Silva',
      nivel_acesso: 2
    ),
    Usuario(
      id_usuario: 11,
      usuario: 'ana.paula',
      nome: 'Ana Paula Martins',
      nivel_acesso: 1
    ),
    Usuario(
      id_usuario: 12,
      usuario: 'caio.fernandes',
      nome: 'Caio Fernandes dos Santos',
      nivel_acesso: 3
    ),
    Usuario(
      id_usuario: 13,
      usuario: 'juliana.moura',
      nome: 'Juliana Moura Ferreira',
      nivel_acesso: 2
    ),
    Usuario(
      id_usuario: 14,
      usuario: 'bruno.lima',
      nome: 'Bruno Lima dos Anjos',
      nivel_acesso: 1
    ),
    Usuario(
      id_usuario: 15,
      usuario: 'sabrina.alves',
      nome: 'Sabrina Alves Costa',
      nivel_acesso: 3
    ),
    Usuario(
      id_usuario: 16,
      usuario: 'daniel.souza',
      nome: 'Daniel Souza Ramos',
      nivel_acesso: 2
    ),
    Usuario(
      id_usuario: 17,
      usuario: 'aline.silveira',
      nome: 'Aline Silveira Rocha',
      nivel_acesso: 1
    ),
    Usuario(
      id_usuario: 18,
      usuario: 'lucas.pereira',
      nome: 'Lucas Pereira da Cruz',
      nivel_acesso: 3
    ),
    ];
  }
}