import 'package:flutter/material.dart';

class Input2Widget extends StatefulWidget {
  final bool obscure;
  final String txt;
  final Icon ico;
  
  const Input2Widget({
    super.key, 
    required this.obscure, 
    required this.txt, 
    required this.ico, 
  });

  @override
  State<Input2Widget> createState() => _Input2State();
}

class _Input2State extends State<Input2Widget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscure,
      decoration: InputDecoration(
        labelText: widget.txt,
        prefixIcon: widget.ico,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}