import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class Input1Widget extends StatefulWidget {
  final bool obscure;
  const Input1Widget({
    super.key, 
    required this.obscure, 
  });

  @override
  State<Input1Widget> createState() => _Input1State();
}

class _Input1State extends State<Input1Widget> {
  var colorsClass = ColorsClass();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: colorsClass.terciaryColor,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border:UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorsClass.terciaryColor,
          )
        )
      ),
    );
  }
}