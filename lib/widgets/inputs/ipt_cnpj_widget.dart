import 'package:flutter/material.dart';
import 'package:ordem_pro/cores.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

class InputCNPJ extends StatefulWidget {
  final TextEditingController? controller;
  const InputCNPJ({super.key, this.controller});

  @override
  State<InputCNPJ> createState() => InputCNPJState();
}

class InputCNPJState extends State<InputCNPJ> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return TextFormField(
      controller: widget.controller,
      cursorColor: cor.terciaria,
      keyboardType: TextInputType.number,
      maxLength: 18,
      inputFormatters: [MaskedInputFormatter('##.###.###/####-##')],
      decoration: InputDecoration(
        hintText: '00.000.000/0000-00',
        hintStyle: TextStyle(color: cor.terciaria),
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
