import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_icon_widget.dart';

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
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              //FotoDePerfilWidget(img: 'lib/assets/imgs/eu.png'),
              SizedBox(height: 30),

              Align(
                alignment: Alignment.center,
                child: Text('Você ainda não está logado.', style: TextStyle(fontSize: 18)),
              ),

              Image.asset("lib/assets/imgs/robo_quebrado.jpg", height: 350,),

              SizedBox(height: 30),
              ButtonComIcon(
                txt: 'Fazer login',
                onPressed: () {
                  context.push(context.namedLocation("Login"));
                },
                tam: 190,
                ico: Icon(Icons.login, color: Colors.white),
              ),
            ],
          ), 
        ),
      ),
    );
  }
}
