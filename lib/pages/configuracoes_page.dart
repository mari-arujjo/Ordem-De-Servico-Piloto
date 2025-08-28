import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/widgets/visualiza%C3%A7%C3%A3o/foto_widget.dart';

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
          padding: EdgeInsets.only(right: 30, left: 30, bottom: 30, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FotoDePerfilWidget(img: '', tam: 35),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mariana Araújo Silva', style: TextStyle(fontSize: 20),),
                      Text('mariana@email.com.br')
                    ]
                  )
                ]
              ),
              SizedBox(height: 15),
              ButtonPadrao(
                txt: 'Editar perfil',
                onPressed: () {
                  context.goNamed("meuPerfil");
                },
                tam: 350,
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
