import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class ButtonComIcon extends StatefulWidget {
  final String txt;
  final VoidCallback onPressed;
  final double tam;
  final Icon ico;

  const ButtonComIcon({
    super.key,
    required this.txt,
    required this.onPressed,
    required this.tam, 
    required this.ico,
  });

  @override
  State<ButtonComIcon> createState() => _ButtonComIconState();
}

class _ButtonComIconState extends State<ButtonComIcon> {
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

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.ico,
            SizedBox(width: 5),
            Text(
              widget.txt,
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
