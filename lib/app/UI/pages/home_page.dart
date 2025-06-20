import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/variacoes/button1_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bem vindo!')),

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Image.asset(
                'lib/app/assets/imgs/tudo_em_ordem.png',
                width: 230,
                height: 230,
              ),
              SizedBox(height: 20),

              Button1Widget(
                txt: 'Atendimento',
                onPressed: () {
                  context.goNamed("atendimento");
                },
                tam: 200,
              ),
              SizedBox(height: 20),

              Button1Widget(
                txt: 'Manutenção',
                onPressed: () {
                  context.goNamed("manutencao");
                },
                tam: 200,
              ),
              SizedBox(height: 20),

              Button1Widget(
                txt: 'Ordem de serviço',
                onPressed: () {
                  context.goNamed("ordemOS");
                },
                tam: 200,
              ),
              SizedBox(height: 20),

              Button1Widget(
                txt: 'Gestão de usuários',
                onPressed: () {
                  context.goNamed("gestaoUsuarios");
                },
                tam: 200,
              ),

              /*SizedBox(height: 20),
              Button1Widget(
                txt: 'TESTE DA API',
                onPressed: () {
                  context.goNamed("Teste");
                },
                tam: 200,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
