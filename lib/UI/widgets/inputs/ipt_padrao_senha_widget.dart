import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';
import 'package:provider/provider.dart';

class InputPadraoSenha extends StatefulWidget {
  final TextEditingController? controller;
  const InputPadraoSenha({super.key, this.controller});

  @override
  State<InputPadraoSenha> createState() => _Input3State();
}

class _Input3State extends State<InputPadraoSenha> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return TextFormField(
      controller: widget.controller,
      obscureText: isObscured,
      cursorColor: cor.terciaria,

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
