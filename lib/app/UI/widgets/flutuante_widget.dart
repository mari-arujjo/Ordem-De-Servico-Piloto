import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/colors.dart';

class BotaoFlutuanteWidget extends StatefulWidget {
  const BotaoFlutuanteWidget({super.key});

  @override
  State<BotaoFlutuanteWidget> createState() => _FlutuanteState();
}

class _FlutuanteState extends State<BotaoFlutuanteWidget> {
  var colorsClass = ColorsClass();
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    Color corFundo;
    if (pressed == false) {
      corFundo = colorsClass.primaryColor;
    } else {
      corFundo = colorsClass.terciaryColor;
    }

    return FloatingActionButton.extended(
      foregroundColor: Colors.white,
      backgroundColor: corFundo,
      onPressed: () {
        setState(() {
          pressed = true;
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          // ignore: use_build_context_synchronously
          context.goNamed('cadastroUsuario');
          setState(() {
            pressed = false;
          });
        });
      },

      label: const Text('Novo'),
      icon: Icon(Icons.add),
    );
  }
}
