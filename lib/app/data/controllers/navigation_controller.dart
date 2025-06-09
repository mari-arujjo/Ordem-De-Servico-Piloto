import 'package:flutter/material.dart';

class NavigationController {

  void navegacao (BuildContext context, int atualIndex, int novoIndex){
    if (novoIndex == atualIndex) return;

    final rotas = ['/login','/', '/meuPerfil'];
    Navigator.pushNamed(context, rotas[novoIndex]);
  }
}