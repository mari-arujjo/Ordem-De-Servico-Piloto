import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/button1_widget.dart';
import 'package:ordem_de_servico/app/src/helper/popup.dart';

class MeuPerfilPage extends StatefulWidget {
  const MeuPerfilPage({super.key});

  @override
  State<MeuPerfilPage> createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfilPage> {
  var popUpSair = PopUp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Button1Widget(
                txt: 'Fazer login!',
                onPressed: () {
                  context.push(context.namedLocation("Login"));
                },
                tam: 200,
              ),

              SizedBox(height: 20),
              Button1Widget(
                txt: 'Sair',
                onPressed: () {
                  popUpSair.PopUpSair(context);
                },
                tam: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
