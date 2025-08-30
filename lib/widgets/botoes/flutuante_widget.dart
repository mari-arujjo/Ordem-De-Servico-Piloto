import 'package:flutter/material.dart';
import 'package:ordem_pro/cores.dart';
import 'package:provider/provider.dart';

class BotaoFlutuanteWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const BotaoFlutuanteWidget({super.key, required this.onPressed});

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
          widget.onPressed();
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
