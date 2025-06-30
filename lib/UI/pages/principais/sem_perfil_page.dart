import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/container_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/foto_widget.dart';

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
              FotoDePerfilWidget(img: 'lib/app/assets/imgs/eu.png'),
              SizedBox(height: 30),

              ContainerPadrao(
                child: Form(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Nome:', style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 5),
                      InputPadrao(),

                      SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Usuário:', style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 5),
                      InputPadrao(),

                      SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nível de acesso:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 5),
                      InputPadrao(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),
              ButtonPadrao(
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
