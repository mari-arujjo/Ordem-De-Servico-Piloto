import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class Input2Widget extends StatefulWidget {
  final bool obscure;
  final String txt;
  final Icon ico;
  
  const Input2Widget({
    super.key, 
    required this.obscure, 
    required this.txt, 
    required this.ico, 
  });

  @override
  State<Input2Widget> createState() => _Input2State();
}

class _Input2State extends State<Input2Widget> {
  var colorsClass = ColorsClass();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: colorsClass.terciaryColor,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        labelText: widget.txt,
        labelStyle: TextStyle(color: colorsClass.terciaryColor),
        prefixIcon: widget.ico,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorsClass.terciaryColor
          )
        ),
      ),
    );
  }
}