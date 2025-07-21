import 'package:flutter/material.dart';

class CadastroFornecedorPage extends StatefulWidget {
  const CadastroFornecedorPage({super.key});

  @override
  State<CadastroFornecedorPage> createState() => _CadastroFornecedorPageState();
}

class _CadastroFornecedorPageState extends State<CadastroFornecedorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de fornecedores'),
      ),
    );
  }
}