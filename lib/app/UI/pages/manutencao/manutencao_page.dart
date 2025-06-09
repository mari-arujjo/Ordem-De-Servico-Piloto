import 'package:flutter/material.dart';

class ManutencaoPage extends StatefulWidget {
  const ManutencaoPage({super.key});

  @override
  State<ManutencaoPage> createState() => _ManutencaoState();
}

class _ManutencaoState extends State<ManutencaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manutenção',
        style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
    );
  }
}