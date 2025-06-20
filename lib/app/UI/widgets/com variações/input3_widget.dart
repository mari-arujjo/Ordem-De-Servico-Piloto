import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class Input3Widget extends StatefulWidget {
  final String txt;
  
  const Input3Widget({
    super.key, 
    required this.txt, 
  });

  @override
  State<Input3Widget> createState() => _Input2State();
}

class _Input2State extends State<Input3Widget> {
  var colorsClass = ColorsClass();
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured,
      cursorColor: colorsClass.terciaryColor,

      decoration: InputDecoration(
        labelText: widget.txt,
        labelStyle: TextStyle(color: colorsClass.terciaryColor),
        prefixIcon: IconButton(
          icon: Icon(
            isObscured ? Icons.visibility_off :  Icons.visibility,
          ),
          onPressed: (){
            setState(() {
              isObscured = !isObscured;
            });
          }, 
        ),
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