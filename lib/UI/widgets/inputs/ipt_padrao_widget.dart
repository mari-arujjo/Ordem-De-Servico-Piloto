import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';
import 'package:provider/provider.dart';

class InputPadrao extends StatefulWidget {
  final TextEditingController? controller;
  const InputPadrao({super.key, this.controller});

  @override
  State<InputPadrao> createState() => _Input1State();
}

class _Input1State extends State<InputPadrao> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return TextFormField(
      controller: widget.controller,
      cursorColor: cor.terciaria,
      decoration: InputDecoration(
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
