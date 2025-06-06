import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/app/assets/imgs/tudo_em_ordem.png', width: 230, height: 230),
            SizedBox(height: 20),

            ButtonWidget(txt: 'Atendimento'),
            SizedBox(height: 20),

            ButtonWidget(txt: 'Manutenção'),
            SizedBox(height: 20),

            ButtonWidget(txt: 'Ordem de serviço'),
            SizedBox(height: 20),

            ButtonWidget(txt: 'Gestão de usuários'),
          ],
        ),
      ),
    );
  }
}