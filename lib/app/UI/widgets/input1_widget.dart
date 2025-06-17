import 'package:flutter/material.dart';

class Input1Widget extends StatefulWidget {
  final bool obscure;
  const Input1Widget({
    super.key, 
    required this.obscure, 
  });

  @override
  State<Input1Widget> createState() => _Input1State();
}

class _Input1State extends State<Input1Widget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border:UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}