import 'package:flutter/material.dart';

class MeuPerfilPage extends StatefulWidget {
  const MeuPerfilPage({super.key});

  @override
  State<MeuPerfilPage> createState() => _MeuPerfilState();
}


class _MeuPerfilState extends State<MeuPerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil',
        style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(

          ),
        ),
      ),
    );
  }
}