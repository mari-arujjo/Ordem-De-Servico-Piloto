import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
///import 'package:ordem_de_servico/src/entidades/usuario/endpoins.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vindo!'),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed("configuracoes");
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'lib/assets/imgs/tudo_em_ordem.png',
                width: 180,
                height: 180,
              ),
              SizedBox(height: 20),

              ButtonPadrao(
                txt: 'Atendimento',
                onPressed: () {
                  context.goNamed("atendimento");
                },
                tam: 250,
              ),
              SizedBox(height: 20),

              ButtonPadrao(
                txt: 'Manutenção',
                onPressed: () {
                  context.goNamed("manutencao");
                },
                tam: 250,
              ),
              SizedBox(height: 20),

              ButtonPadrao(
                txt: 'Ordem de serviço',
                onPressed: () {
                  context.goNamed("ordemOS");
                },
                tam: 250,
              ),
              SizedBox(height: 20),

              ButtonPadrao(
                txt: 'Gestão de usuários',
                onPressed: () {
                  context.goNamed("gestaoUsuarios");
                },
                tam: 250,
              ),

              /*SizedBox(height: 20),
              ButtonPadrao(
                txt: 'Endpoints',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EndPointsPage()),
                  );
                },
                tam: 250,
              ),
              SizedBox(height: 30),*/
            ],
          ),
        ),
      ),
    );
  }
}
