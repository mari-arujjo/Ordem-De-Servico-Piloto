import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/assets/color/colors.dart';

class CarregandoWidget extends StatefulWidget {
  const CarregandoWidget({super.key});

  @override
  State<CarregandoWidget> createState() => _CarregandoWidgetState();
}

class _CarregandoWidgetState extends State<CarregandoWidget> {
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: colorsClass.terciaryColor,
    );
  }
}