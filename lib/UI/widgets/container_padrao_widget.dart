import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class ContainerPadrao extends StatefulWidget {
  final Widget child;
  const ContainerPadrao({super.key, required this.child});

  @override
  State<ContainerPadrao> createState() => _ContainerPadraoState();
}

class _ContainerPadraoState extends State<ContainerPadrao> {
  var cor = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cor.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.child,
    );
  }
}
