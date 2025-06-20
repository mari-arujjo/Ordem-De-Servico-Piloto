import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/src/api/api.dart';

class TesteApiPage extends StatefulWidget {
  const TesteApiPage({super.key});

  @override
  State<TesteApiPage> createState() => _TesteApiPageState();
}

class _TesteApiPageState extends State<TesteApiPage> {
  String resultado = 'Carregando...';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teste de API')),
      body: Center(child: Text(resultado)),
    );
  }

  @override
  void initState() {
    super.initState();
    testarApi();
  }

  Future<void> testarApi() async {
    final api = Api();

    try {
      final response = await api.get('api/usuario'); // Substitua pelo seu endpoint real
      setState(() {
        resultado = response.data.toString();
      });
    } catch (e) {
      setState(() {
        resultado = 'Erro ao acessar API: $e';
      });
    }
  }
}
