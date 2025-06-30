import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class InputPadrao extends StatefulWidget {
  final TextEditingController? controller;
  const InputPadrao({
    super.key, this.controller, 
  });

  @override
  State<InputPadrao> createState() => _Input1State();
}

class _Input1State extends State<InputPadrao> {
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