import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class InputOutline extends StatefulWidget {
  final String txt;
  final Icon ico;
  
  const InputOutline({
    super.key,  
    required this.txt, 
    required this.ico, 
  });

  @override
  State<InputOutline> createState() => _Input2State();
}

class _Input2State extends State<InputOutline> {
  var colorsClass = ColorsClass();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: colorsClass.terciaryColor,
      decoration: InputDecoration(
        labelText: widget.txt,
        labelStyle: TextStyle(color: colorsClass.terciaryColor),
        prefixIcon: widget.ico,
        filled: true,
        fillColor: Colors.transparent,
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