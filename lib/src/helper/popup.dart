// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class PopUp {
  var cor = ColorsClass();

  void PopUpAlert(BuildContext context, Object erro) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Atenção!'),
          content: Text(erro.toString()),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Ok', style: TextStyle(color: cor.terciaryColor)),
            ),
          ],
        );
      },
    );
  }

  void PopUpCancel(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancelar operação'),
          content: const Text(
            'Tem certeza que deseja cancelar? Seu progresso será perdido.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Não', style: TextStyle(color: cor.terciaryColor)),
            ),
            TextButton(
              onPressed: () {
                ///context.push(context.namedLocation('Home'));
                context.pop();
                context.pop();
              },
              child: Text('Sim', style: TextStyle(color: cor.terciaryColor)),
            ),
          ],
        );
      },
    );
  }

  void PopUpSair(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sair'),
          content: const Text('Tem certeza que deseja sair?'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Não', style: TextStyle(color: cor.terciaryColor)),
            ),
            TextButton(
              onPressed: () {
                exit(0);
              },
              child: Text('Sim', style: TextStyle(color: cor.terciaryColor)),
            ),
          ],
        );
      },
    );
  }

  void PopUpSalvar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Salvar'),
          content: const Text('Cadastro realizado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
                context.pop();
              },
              child: Text('Ok', style: TextStyle(color: cor.terciaryColor)),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> PopUpExcluir(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir'),
          content: const Text(
            'Tem certeza que deseja excluir? Os dados não poderão ser recuperados.',
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(false), // Não confirmou
              child: Text('Não', style: TextStyle(color: cor.terciaryColor)),
            ),
            TextButton(
              onPressed: () => context.pop(true), // Confirmou
              child: Text('Sim', style: TextStyle(color: cor.terciaryColor)),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> PopUpAlterar(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Salvar alterações'),
          content: const Text(
            'Quer salvar as mudanças feitas? Isso vai atualizar os dados no sistema.',
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(false),
              child: Text('Não', style: TextStyle(color: cor.terciaryColor)),
            ),

            TextButton(
              onPressed: () => context.pop(true),
              child: Text('Sim', style: TextStyle(color: cor.terciaryColor)),
            ),
          ],
        );
      },
    );
  }
}
