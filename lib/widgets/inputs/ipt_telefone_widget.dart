import 'package:flutter/material.dart';
import 'package:ordem_pro/cores.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

class InputTelefone extends StatefulWidget {
  final TextEditingController? controller;
  const InputTelefone({super.key, this.controller});

  @override
  State<InputTelefone> createState() => _InputTelefoneState();
}

class _InputTelefoneState extends State<InputTelefone> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return TextFormField(
      controller: widget.controller,
      cursorColor: cor.terciaria,
      keyboardType: TextInputType.phone,
      maxLength: 15,
      inputFormatters: [
        PhoneInputFormatter(defaultCountryCode: 'BR', allowEndlessPhone: true),
      ],
      decoration: InputDecoration(
        hintText: '(00) 90000-0000',
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
