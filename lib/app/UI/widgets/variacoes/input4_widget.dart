import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class Input4Widget extends StatefulWidget {
  final String txt;
  
  const Input4Widget({
    super.key, 
    required this.txt, 
  });

  @override
  State<Input4Widget> createState() => _Input4State();
}

class _Input4State extends State<Input4Widget> {
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
        prefixIcon: Icon(Icons.password),
        suffixIcon: IconButton(
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