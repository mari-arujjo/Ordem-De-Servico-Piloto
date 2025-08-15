import 'package:flutter/material.dart';

class ButtonCores extends StatefulWidget {
  final Color corPrincipal;
  final Color corClick;
  final VoidCallback onPressed;
  final bool selecionado;
  const ButtonCores({
    super.key,
    required this.onPressed,
    required this.corPrincipal,
    required this.corClick,
    this.selecionado = false,
  });

  @override
  State<ButtonCores> createState() => _ButtonCoresState();
}

class _ButtonCoresState extends State<ButtonCores> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,

      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            widget.selecionado ? widget.corClick : widget.corPrincipal,
          ),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        child:
            widget.selecionado ? Icon(Icons.check, color: Colors.white, size: 30,) : null,
      ),
    );
  }
}
