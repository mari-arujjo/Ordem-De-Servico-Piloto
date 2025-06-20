import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class Input1Widget extends StatefulWidget {
  final TextEditingController? controller;
  const Input1Widget({
    super.key, this.controller, 
  });

  @override
  State<Input1Widget> createState() => _Input1State();
}

class _Input1State extends State<Input1Widget> {
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: colorsClass.terciaryColor,
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