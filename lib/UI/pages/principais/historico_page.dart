import 'package:flutter/material.dart';

class HistoricoPage extends StatefulWidget {
  final int idUsuario;
  const HistoricoPage({super.key, required this.idUsuario});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Histórico de ações')));
  }
}
