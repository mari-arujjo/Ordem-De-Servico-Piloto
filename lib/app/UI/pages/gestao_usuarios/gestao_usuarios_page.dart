import 'package:flutter/material.dart';

class GestaoUsuariosPage extends StatefulWidget {
  const GestaoUsuariosPage({super.key});

  @override
  State<GestaoUsuariosPage> createState() => _GestaoUsuariosState();
}

class _GestaoUsuariosState extends State<GestaoUsuariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestão de usuários',
        style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 70)),
      ),
    );
  }
}