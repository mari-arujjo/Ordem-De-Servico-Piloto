import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/com%20varia%C3%A7%C3%B5es/button1_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/foto_widget.dart';
import 'package:ordem_de_servico/app/src/helper/popup.dart';
import 'package:ordem_de_servico/colors.dart';

class MeuPerfilPage extends StatefulWidget {
  const MeuPerfilPage({super.key});

  @override
  State<MeuPerfilPage> createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfilPage> {
  var colorsClass = ColorsClass();
  var popUpSair = PopUp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              FotoPerfilWidget(img: 'lib/app/assets/imgs/eu.png'),

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
