import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

class InputCEP extends StatefulWidget {
  final TextEditingController? controller;
  const InputCEP({super.key, this.controller});

  @override
  State<InputCEP> createState() => InputCEPState();
}

class InputCEPState extends State<InputCEP> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return TextFormField(
      controller: widget.controller,
      cursorColor: cor.terciaria,
      keyboardType: TextInputType.number,
      maxLength: 9,
      inputFormatters: [MaskedInputFormatter('#####-###')],
      decoration: InputDecoration(
        hintText: '00000-000',
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
