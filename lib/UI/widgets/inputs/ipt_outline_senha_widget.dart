import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class InputOutlineSenha extends StatefulWidget {
  final String txt;

  const InputOutlineSenha({super.key, required this.txt});

  @override
  State<InputOutlineSenha> createState() => _Input4State();
}

class _Input4State extends State<InputOutlineSenha> {
  var cor = ColorsClass();
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured,
      cursorColor: cor.terciaryColor,

      decoration: InputDecoration(
        labelText: widget.txt,
        labelStyle: TextStyle(color: cor.terciaryColor),
        prefixIcon: Icon(Icons.password),
        suffixIcon: IconButton(
          icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
        ),

        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: cor.terciaryColor),
        ),
      ),
    );
  }
}
