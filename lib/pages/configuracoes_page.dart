import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/widgets/botoes/bt_padrao_widget.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ButtonPadrao(
                txt: 'Editar perfil',
                onPressed: () {
                  context.goNamed("meuPerfil");
                },
                tam: 300,
              ),
              SizedBox(height: 30),
              ButtonPadrao(
                txt: 'Tema do app',
                onPressed: () {
                  context.goNamed("Tema");
                },
                tam: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
