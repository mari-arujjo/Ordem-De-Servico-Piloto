import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/widgets/botoes/bt_icon_txt_widget.dart';

class SemPerfilPage extends StatefulWidget {
  const SemPerfilPage({super.key});

  @override
  State<SemPerfilPage> createState() => _SemPerfilPageState();
}

class _SemPerfilPageState extends State<SemPerfilPage> {
  get popUpSair => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //FotoDePerfilWidget(img: 'lib/assets/imgs/eu.png'),
              SizedBox(height: 30),

              Align(
                alignment: Alignment.center,
                child: Text(
                  'Você ainda não está logado.',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              Image.asset(
                "lib/assets/imgs/robo_quebrado.jpg",
                height: 350,
                width: 350,
              ),

              SizedBox(height: 30),
              ButtonComIconTexto(
                txt: 'Fazer login',
                onPressed: () {
                  context.push(context.namedLocation("Login"));
                },
                tam: 190,
                ico: Icon(Icons.login, color: Colors.white),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
