import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_icon_txt_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/src/helper/popup.dart';

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
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              //FotoDePerfilWidget(img: 'lib/assets/imgs/eu.png'),
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
              ButtonComIconTexto(
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
