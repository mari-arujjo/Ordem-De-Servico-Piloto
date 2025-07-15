import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:provider/provider.dart';

class CarregandoWidget extends StatefulWidget {
  const CarregandoWidget({super.key});

  @override
  State<CarregandoWidget> createState() => _CarregandoWidgetState();
}

class _CarregandoWidgetState extends State<CarregandoWidget> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return CircularProgressIndicator(color: cor.terciaria);
  }
}
