import 'package:flutter/material.dart';

class AtendimentoPage extends StatefulWidget {
  const AtendimentoPage({super.key});

  @override
  State<AtendimentoPage> createState() => _AtendimentoState();
}

class _AtendimentoState extends State<AtendimentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atendimento',
        style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
    );
  }
}