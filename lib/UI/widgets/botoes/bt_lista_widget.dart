import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';
import 'package:provider/provider.dart';

class ButtonLista extends StatefulWidget {
  final String txt;
  final VoidCallback onPressed;

  const ButtonLista({super.key, required this.txt, required this.onPressed});

  @override
  State<ButtonLista> createState() => _ButtonListaState();
}

class _ButtonListaState extends State<ButtonLista> {
  bool pressionado = false;

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return SizedBox(
      height: 50,

      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(3),
          shadowColor: const WidgetStatePropertyAll(Colors.black),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return cor.terciaria;
            }
            return Colors.white;
          }),
          overlayColor: WidgetStateProperty.all(cor.terciaria_clara),
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
                style: TextStyle(fontSize: 16, color: cor.primaria),
              ),
            ),

            Icon(Icons.edit, color: cor.primaria),
          ],
        ),
      ),
    );
  }
}
