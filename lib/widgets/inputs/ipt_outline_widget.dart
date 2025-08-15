import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:provider/provider.dart';

class InputOutline extends StatefulWidget {
  final TextEditingController? controller;
  final String txt;
  final Icon ico;

  const InputOutline({super.key, required this.txt, required this.ico, this.controller});

  @override
  State<InputOutline> createState() => _Input2State();
}

class _Input2State extends State<InputOutline> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return TextFormField(
      controller: widget.controller,
      cursorColor: cor.terciaria,
      decoration: InputDecoration(
        labelText: widget.txt,
        labelStyle: TextStyle(color: cor.terciaria),
        prefixIcon: widget.ico,
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: cor.terciaria),
        ),
      ),
    );
  }
}
