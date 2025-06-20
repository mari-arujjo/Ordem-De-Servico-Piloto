import 'package:ordem_de_servico/app/src/models/usuario_model.dart';

class GestaoUsuariosController {
  List<Usuario> allUsers = [];

  GestaoUsuariosController() {
    allUsers = [
      Usuario(
        id_usuario: 1,
        usuario: 'mari',
        nome: 'Mariana Araújo Silva',
        nivel_acesso: 1,
      ),
      Usuario(
        id_usuario: 3,
        usuario: 'luyz',
        nome: 'Luyz Henryk Duarte de Medeiros',
        nivel_acesso: 1,
      ),
      Usuario(
        id_usuario: 5,
        usuario: 'vitinho',
        nome: 'Victor Gabriel Revorêdo Sobral',
        nivel_acesso: 2,
      ),
      Usuario(
        id_usuario: 6,
        usuario: 'jao.gabrel',
        nome: 'João Gabriel Araújo Silva',
        nivel_acesso: 3,
      ),
      Usuario(
        id_usuario: 7,
        usuario: 'karen',
        nome: 'Karen Helloisa Araújo',
        nivel_acesso: 3,
      ),
      Usuario(
        id_usuario: 9,
        usuario: 'leticia',
        nome: 'Letícia Alves de Araújo',
        nivel_acesso: 2,
      ),
      Usuario(id_usuario: 10, usuario: 'rafa', nome: 'Rafaela Souza Lima', nivel_acesso: 2),
      Usuario(id_usuario: 11, usuario: 'lucas.m', nome: 'Lucas Matheus Oliveira', nivel_acesso: 3),
      Usuario(id_usuario: 12, usuario: 'duda.a', nome: 'Maria Eduarda Andrade', nivel_acesso: 2),
      Usuario(id_usuario: 13, usuario: 'caique', nome: 'Caique Ferreira da Silva', nivel_acesso: 2),
      Usuario(id_usuario: 14, usuario: 'yasmin.b', nome: 'Yasmin Beatriz Cunha', nivel_acesso: 3),
      Usuario(id_usuario: 15, usuario: 'danilo.s', nome: 'Danilo Santos Ramos', nivel_acesso: 2),
      Usuario(id_usuario: 16, usuario: 'bianca.r', nome: 'Bianca Rocha Alves', nivel_acesso: 1),
      Usuario(id_usuario: 17, usuario: 'andre.m', nome: 'André Moura Barreto', nivel_acesso: 2),
      Usuario(id_usuario: 18, usuario: 'aline.c', nome: 'Aline Cristina Duarte', nivel_acesso: 3),
      Usuario(id_usuario: 19, usuario: 'bruno.l', nome: 'Bruno Leonardo Viana', nivel_acesso: 1),
      Usuario(id_usuario: 20, usuario: 'joana.f', nome: 'Joana Figueiredo Peixoto', nivel_acesso: 2),
      Usuario(id_usuario: 21, usuario: 'hugo.c', nome: 'Hugo César Martins', nivel_acesso: 3),
      Usuario(id_usuario: 22, usuario: 'natalia.s', nome: 'Natália Souza Ribeiro', nivel_acesso: 2),
      Usuario(id_usuario: 23, usuario: 'caio.p', nome: 'Caio Pedro Albuquerque', nivel_acesso: 2),
      Usuario(id_usuario: 24, usuario: 'mirela.t', nome: 'Mirela Tavares Lima', nivel_acesso: 1),
      Usuario(id_usuario: 25, usuario: 'felipe.m', nome: 'Felipe Mendes Rocha', nivel_acesso: 3),
      Usuario(id_usuario: 26, usuario: 'ana.j', nome: 'Ana Júlia Costa', nivel_acesso: 2),
      Usuario(id_usuario: 27, usuario: 'tiago.b', nome: 'Tiago Batista Ramos', nivel_acesso: 1),
      Usuario(id_usuario: 28, usuario: 'juliana.k', nome: 'Juliana Karla Teixeira', nivel_acesso: 2),
      Usuario(id_usuario: 29, usuario: 'marco.t', nome: 'Marco Túlio Fernandes', nivel_acesso: 3),
      Usuario(id_usuario: 30, usuario: 'isabela.n', nome: 'Isabela Nunes Soares', nivel_acesso: 2),
      Usuario(id_usuario: 31, usuario: 'rodrigo.a', nome: 'Rodrigo Alves Pinto', nivel_acesso: 1),
      Usuario(id_usuario: 32, usuario: 'vanessa.r', nome: 'Vanessa Rocha Barreto', nivel_acesso: 2),
    ];
  }
}
