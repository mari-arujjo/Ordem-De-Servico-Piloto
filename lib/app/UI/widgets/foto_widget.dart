import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class FotoPerfilWidget extends StatefulWidget {
  final String img;

  const FotoPerfilWidget({super.key, required this.img});

  @override
  State<FotoPerfilWidget> createState() => _FotoPerfilWidgetState();
}

class _FotoPerfilWidgetState extends State<FotoPerfilWidget> {
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: colorsClass.gray,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.asset(widget.img, fit: BoxFit.cover),
    );
  }
}
