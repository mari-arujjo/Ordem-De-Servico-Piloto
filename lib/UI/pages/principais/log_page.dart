import 'package:flutter/material.dart';

class LogPage extends StatefulWidget {
  final int idUsuario;
  const LogPage({super.key, required this.idUsuario});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de ações'),
      )

    );
  }
}