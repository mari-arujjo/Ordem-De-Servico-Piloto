import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class InputPadraoSenha extends StatefulWidget {
  
  const InputPadraoSenha({
    super.key,
  });

  @override
  State<InputPadraoSenha> createState() => _Input3State();
}

class _Input3State extends State<InputPadraoSenha> {
  var colorsClass = ColorsClass();
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured,
      cursorColor: colorsClass.terciaryColor,

      decoration: InputDecoration(
        labelStyle: TextStyle(color: colorsClass.terciaryColor),

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