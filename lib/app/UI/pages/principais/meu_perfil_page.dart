import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/botoes/bt_icon_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/container_padrao_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/inputs/ipt_padrao_widget.dart';
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

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              FotoDePerfilWidget(img: 'lib/app/assets/imgs/eu.png'),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ID:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text('1'),
                ],
              ),

              SizedBox(height: 20),

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
              ButtonComIcon(
                txt: 'Login',
                onPressed: () {
                  context.goNamed('Login');
                },
                tam: 140,
                ico: Icon(Icons.login, color: Colors.white),
              ),
              SizedBox(height: 10),
              ButtonComIcon(
                txt: 'Logout',
                onPressed: () {
                  popUpSair.PopUpSair(context);
                },
                tam: 140, 
                ico: Icon(Icons.logout, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
