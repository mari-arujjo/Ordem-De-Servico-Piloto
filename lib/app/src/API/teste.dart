import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/botoes/bt_padrao_widget.dart';
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(resultado),
              ButtonPadrao(
                txt: 'HOME', 
                onPressed: (){
                  context.goNamed('Home');
                }, 
                tam: 100)
            ],
          )
        ),
      )
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
      final response = await api.get('/api/OK'); 
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
