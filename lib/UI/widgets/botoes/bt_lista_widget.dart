import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class ButtonLista extends StatefulWidget {
  final String txt;
  final VoidCallback onPressed;

  const ButtonLista({super.key, required this.txt, required this.onPressed});

  @override
  State<ButtonLista> createState() => _ButtonListaState();
}

class _ButtonListaState extends State<ButtonLista> {
  bool pressionado = false;
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(3),
          shadowColor: const WidgetStatePropertyAll(Colors.black),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorsClass.terciaryColor;
            }
            return Colors.white;
          }),
          overlayColor: WidgetStateProperty.all(colorsClass.quarternaryColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),

        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.txt,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: colorsClass.primaryColor),
              ),
            ),

            Icon(Icons.edit, color: colorsClass.primaryColor),
          ],
        ),
      ),
    );
  }
}
