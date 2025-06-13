import 'package:flutter/material.dart';

class OrdemOsPage extends StatefulWidget {
  const OrdemOsPage({super.key});

  @override
  State<OrdemOsPage> createState() => _OrdemOstState();
}

class _OrdemOstState extends State<OrdemOsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordem de Serviço')
      ),
    );
  }
}