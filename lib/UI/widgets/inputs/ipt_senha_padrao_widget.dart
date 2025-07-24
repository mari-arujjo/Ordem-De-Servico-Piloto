import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:provider/provider.dart';

class InputPadraoSenha extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLength;
  const InputPadraoSenha({super.key, this.controller, this.maxLength});

  @override
  State<InputPadraoSenha> createState() => _InputPadraoSenhaState();
}

class _InputPadraoSenhaState extends State<InputPadraoSenha> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return TextFormField(
      controller: widget.controller,
      obscureText: isObscured,
      cursorColor: cor.terciaria,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: cor.terciaria),

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
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: cor.terciaria),
        ),
      ),
    );
  }
}
