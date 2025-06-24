import 'package:ordem_de_servico/app/src/models/usuario_model.dart';

class UsuarioRepository{
  List<Usuario> all = [];
  List<Usuario> filtered = [];

  UsuarioRepository() {
    all = [
      Usuario(
        id_usuario: 1,
        usuario: 'mari',
        nome: 'Mariana Araújo Silva',
        nivel_acesso: 1,
        foto: 'lib/app/assets/imgs/eu.png'
      ),
      Usuario(
        id_usuario: 3,
        usuario: 'luyz',
        nome: 'Luyz Henryk Duarte de Medeiros',
        nivel_acesso: 1,
        foto: 'lib/app/assets/imgs/luyz.jpg'
      ),
      Usuario(
        id_usuario: 5,
        usuario: 'vitinho',
        nome: 'Victor Gabriel Revorêdo Sobral',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 6,
        usuario: 'jao.gabrel',
        nome: 'João Gabriel Araújo Silva',
        nivel_acesso: 3,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 7,
        usuario: 'karen',
        nome: 'Karen Helloisa Araújo',
        nivel_acesso: 3,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 9,
        usuario: 'leticia',
        nome: 'Letícia Alves de Araújo',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 10,
        usuario: 'marcos',
        nome: 'Marcos Vinícius da Silva',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 11,
        usuario: 'juliana',
        nome: 'Juliana Pereira Lima',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 12,
        usuario: 'ricardo',
        nome: 'Ricardo Almeida Sousa',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 13,
        usuario: 'patricia',
        nome: 'Patrícia Fernandes Costa',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 14,
        usuario: 'carlos',
        nome: 'Carlos Henrique Moura',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 15,
        usuario: 'aline',
        nome: 'Aline Rodrigues Santos',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 16,
        usuario: 'eduardo',
        nome: 'Eduardo Ramos Pinto',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 17,
        usuario: 'fernanda',
        nome: 'Fernanda Martins Braga',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 18,
        usuario: 'rodrigo',
        nome: 'Rodrigo Teixeira Lima',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 19,
        usuario: 'amanda',
        nome: 'Amanda Souza Rocha',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 20,
        usuario: 'lucas',
        nome: 'Lucas Ferreira Nunes',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 21,
        usuario: 'beatriz',
        nome: 'Beatriz Oliveira Melo',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 22,
        usuario: 'gustavo',
        nome: 'Gustavo Carvalho Mendes',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 23,
        usuario: 'carolina',
        nome: 'Carolina Dias Freitas',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 24,
        usuario: 'joao',
        nome: 'João Pedro Andrade',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 25,
        usuario: 'larissa',
        nome: 'Larissa Ribeiro Monteiro',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 26,
        usuario: 'felipe',
        nome: 'Felipe Costa Barros',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 27,
        usuario: 'camila',
        nome: 'Camila Antunes Rocha',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 28,
        usuario: 'renan',
        nome: 'Renan Lima Tavares',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 29,
        usuario: 'gabriela',
        nome: 'Gabriela Duarte Souza',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 30,
        usuario: 'rafael',
        nome: 'Rafael Nogueira Costa',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 31,
        usuario: 'nathalia',
        nome: 'Nathalia Mendes Silva',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 32,
        usuario: 'henrique',
        nome: 'Henrique Barbosa Farias',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 33,
        usuario: 'tamires',
        nome: 'Tamires Lopes da Costa',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 34,
        usuario: 'tiago',
        nome: 'Tiago Fernandes Ramos',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 35,
        usuario: 'vanessa',
        nome: 'Vanessa Rocha Pinheiro',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 36,
        usuario: 'daniel',
        nome: 'Daniel Martins Leal',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 37,
        usuario: 'tatiane',
        nome: 'Tatiane Soares Cruz',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 38,
        usuario: 'paulo',
        nome: 'Paulo Sérgio Lima',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      ),
      Usuario(
        id_usuario: 39,
        usuario: 'eliane',
        nome: 'Eliane Costa Andrade',
        nivel_acesso: 2,
        foto: 'lib/app/assets/imgs/semFoto.png'
      )

    ];
    filtered = [...all];
  }
}