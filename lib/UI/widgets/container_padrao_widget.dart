import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';
import 'package:provider/provider.dart';

class ContainerPadrao extends StatefulWidget {
  final Widget child;
  const ContainerPadrao({super.key, required this.child});

  @override
  State<ContainerPadrao> createState() => _ContainerPadraoState();
}

class _ContainerPadraoState extends State<ContainerPadrao> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cor.secundaria,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.child,
    );
  }
}
