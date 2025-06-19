import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/com%20varia%C3%A7%C3%B5es/button1_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/com%20varia%C3%A7%C3%B5es/container1_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/com%20varia%C3%A7%C3%B5es/input1_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/foto_widget.dart';

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
              FotoPerfilWidget(img: 'lib/app/assets/imgs/eu.png'),
              SizedBox(height: 30),

              Container1Widget(
                child: Form(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Nome:', style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 5),
                      Input1Widget(obscure: false),

                      SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Usuário:', style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 5),
                      Input1Widget(obscure: false),

                      SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nível de acesso:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 5),
                      Input1Widget(obscure: false),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),
              Button1Widget(
                txt: 'Fazer login!',
                onPressed: () {
                  context.push(context.namedLocation("Login"));
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
