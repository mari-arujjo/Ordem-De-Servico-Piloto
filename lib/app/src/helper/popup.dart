import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/colors.dart';

class PopUp {
  // ignore: non_constant_identifier_names
  void PopUpCancel(BuildContext context){
    var colorsClass = ColorsClass();
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Cancelar operação'),
          content: const Text('Tem certeza que deseja cancelar? Seu progresso será perdido.'),
          actions: [
            TextButton(
              onPressed: (){
                GoRouter.of(context).pop();
              }, 
              child: Text(
                'Não',
                style: TextStyle(color: colorsClass.terciaryColor),
              )
            ),
            TextButton(
              onPressed: (){
                context.go('/');
              }, 
              child: Text(
                'Sim', 
                style: TextStyle(color: colorsClass.terciaryColor)),
            )
          ]
        );
      },
    );
  }

  void PopUpSair(BuildContext context){
    var colorsClass = ColorsClass();
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Sair'),
          content: const Text('Tem certeza que deseja sair?'),
          actions: [
            TextButton(
              onPressed: (){
                GoRouter.of(context).pop();
              }, 
              child: Text(
                'Não',
                style: TextStyle(color: colorsClass.terciaryColor),
              )
            ),
            TextButton(
              onPressed: (){
                exit(0);
              }, 
              child: Text(
                'Sim', 
                style: TextStyle(color: colorsClass.terciaryColor)),
            )
          ]
        );
      },
    );
  }
}