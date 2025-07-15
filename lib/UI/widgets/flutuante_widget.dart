import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:provider/provider.dart';

class BotaoFlutuanteWidget extends StatefulWidget {
  const BotaoFlutuanteWidget({super.key});

  @override
  State<BotaoFlutuanteWidget> createState() => _FlutuanteState();
}

class _FlutuanteState extends State<BotaoFlutuanteWidget> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    Color corFundo;
    if (pressed == false) {
      corFundo = cor.primaria;
    } else {
      corFundo = cor.terciaria;
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
