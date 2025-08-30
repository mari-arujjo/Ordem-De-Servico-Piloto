import 'package:flutter/material.dart';
import 'package:ordem_pro/cores.dart';
import 'package:provider/provider.dart';

class ButtonComIconTexto extends StatefulWidget {
  final String txt;
  final VoidCallback onPressed;
  final double tam;
  final Icon ico;

  const ButtonComIconTexto({
    super.key,
    required this.txt,
    required this.onPressed,
    required this.tam,
    required this.ico,
  });

  @override
  State<ButtonComIconTexto> createState() => _ButtonComIconTextoState();
}

class _ButtonComIconTextoState extends State<ButtonComIconTexto> {
  bool pressionado = false;

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return SizedBox(
      height: 45,
      width: widget.tam,

      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(3),
          shadowColor: const WidgetStatePropertyAll(Colors.black),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return cor.terciaria;
            }
            return cor.primaria;
          }),

          overlayColor: WidgetStateProperty.all(cor.terciaria_clara),
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
