import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:ordem_de_servico/widgets/botoes/bt_icon_txt_widget.dart';
import 'package:ordem_de_servico/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/widgets/visualiza%C3%A7%C3%A3o/foto_widget.dart';
import 'package:provider/provider.dart';

class MeuPerfilPage extends StatefulWidget {
  const MeuPerfilPage({super.key});

  @override
  State<MeuPerfilPage> createState() => _MeuPerfilPageState();
}

class _MeuPerfilPageState extends State<MeuPerfilPage> {
  get popUpSair => null;

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    FotoDePerfilWidget(img: 'lib/assets/imgs/eu.png'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(cor.primaria),
                        iconColor: WidgetStatePropertyAll(Colors.white),
                        overlayColor: WidgetStatePropertyAll(
                          cor.terciaria_escuro,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                ContainerPadrao(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nome:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(),
                        SizedBox(height: 20),
                        Text('Usuário:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(),
                        SizedBox(height: 20),
                        Text('Email:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('Mudar senha:', style: TextStyle(fontSize: 18)),
                ),
                ContainerPadrao(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nome:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(),
                        SizedBox(height: 20),
                        Text('Usuário:', style: TextStyle(fontSize: 16)),
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
      ),
    );
  }
}
