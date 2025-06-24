import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/assets/color/colors.dart';

class PopUp {
  var colorsClass = ColorsClass();

  // ignore: non_constant_identifier_names
  void PopUpCancel(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Cancelar operação'),
          content: const Text('Tem certeza que deseja cancelar? Seu progresso será perdido.'),
          actions: [
            TextButton(
              onPressed: (){
                context.pop();
              }, 
              child: Text(
                'Não',
                style: TextStyle(color: colorsClass.terciaryColor),
              )
            ),
            TextButton(
              onPressed: (){
                ///context.push(context.namedLocation('Home'));
                context.pop();
                context.pop();
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

  // ignore: non_constant_identifier_names
  void PopUpSair(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Sair'),
          content: const Text('Tem certeza que deseja sair?'),
          actions: [
            TextButton(
              onPressed: (){
                context.pop();
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


  // ignore: non_constant_identifier_names
  void PopUpSalvar(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Salvar'),
          content: const Text('Cadastro realizado com sucesso!'),
          actions: [
            TextButton(
              onPressed: (){
                context.pop();
                context.pop();
              }, 
              child: Text(
                'Ok',
                style: TextStyle(color: colorsClass.terciaryColor),
              )
            )
          ]
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  void PopUpExcluir(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Excluir'),
          content: const Text('Tem certeza que deseja excluir? Os dados não poderão ser recuperados.'),
          actions: [
            TextButton(
              onPressed: (){
                context.pop();
              }, 
              child: Text(
                'Não',
                style: TextStyle(color: colorsClass.terciaryColor),
              )
            ),
            
            TextButton(
              onPressed: (){
                context.pop();
                context.pop();
                showDialog(
                  context: context, 
                  builder: (context){
                    return AlertDialog(
                      
                      content: Text('Dados excluídos com sucesso.'),
                    );
                  }
                );
                
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

  // ignore: non_constant_identifier_names
  void PopUpAlterar(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Salvar alterações'),
          content: const Text('Quer salvar as mudanças feitas? Isso vai atualizar os dados no sistema.'),
          actions: [
            TextButton(
              onPressed: (){
                context.pop();
              }, 
              child: Text(
                'Não',
                style: TextStyle(color: colorsClass.terciaryColor),
              )
            ),
            
            TextButton(
              onPressed: (){
                context.pop();
                context.pop();
                showDialog(
                  context: context, 
                  builder: (context){
                    return AlertDialog(
                      
                      content: Text('Dados excluídos com sucesso.'),
                    );
                  }
                );
                
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