import 'package:flutter/material.dart';
import 'package:ordem_pro/cores.dart';
import 'package:provider/provider.dart';

class InputOutlineSenha extends StatefulWidget {
  final TextEditingController? controller;
  final String txt;

  const InputOutlineSenha({super.key, required this.txt, this.controller});

  @override
  State<InputOutlineSenha> createState() => _Input4State();
}

class _Input4State extends State<InputOutlineSenha> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return TextFormField(
      controller: widget.controller,
      obscureText: isObscured,
      cursorColor: cor.terciaria,
      decoration: InputDecoration(
        labelText: widget.txt,
        labelStyle: TextStyle(color: cor.terciaria),
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
          borderSide: BorderSide(color: cor.terciaria),
        ),
      ),
    );
  }
}
