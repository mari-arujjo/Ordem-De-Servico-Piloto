import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class FotoDePerfilWidget extends StatefulWidget {
  final String img;

  const FotoDePerfilWidget({super.key, required this.img});

  @override
  State<FotoDePerfilWidget> createState() => _FotoDePerfilWidgetState();
}

class _FotoDePerfilWidgetState extends State<FotoDePerfilWidget> {
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
      child: Image.network(widget.img, fit: BoxFit.cover),
    );
  }
}
