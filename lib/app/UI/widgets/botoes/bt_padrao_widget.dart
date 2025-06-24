import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/assets/color/colors.dart';

class ButtonPadrao extends StatefulWidget {
  final String txt;
  final VoidCallback onPressed;
  final double tam;

  const ButtonPadrao({
    super.key,
    required this.txt,
    required this.onPressed,
    required this.tam,
  });

  @override
  State<ButtonPadrao> createState() => _ButtonPadraoState();
}

class _ButtonPadraoState extends State<ButtonPadrao> {
  bool pressionado = false;
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: widget.tam,

      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(3),
          shadowColor: const WidgetStatePropertyAll(Colors.black),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorsClass.terciaryColor;
            }
            return colorsClass.primaryColor;
          }),
          
          overlayColor: WidgetStateProperty.all(colorsClass.quarternaryColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),

        child: Text(
          widget.txt,
          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15),
        ),
      ),
    );
  }
}
