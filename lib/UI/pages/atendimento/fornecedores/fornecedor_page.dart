import 'package:flutter/material.dart';

class FornecedorPage extends StatefulWidget {
  final int idUsuario;
  const FornecedorPage({super.key, required this.idUsuario});

  @override
  State<FornecedorPage> createState() => _FornecedorPageState();
}

class _FornecedorPageState extends State<FornecedorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('aaa'),
      ),
    );
  }
}
