import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/variacoes/button1_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/container1_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/foto_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/variacoes/input1_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/variacoes/input3_widget.dart';
import 'package:ordem_de_servico/app/src/helper/popup.dart';
import 'package:ordem_de_servico/colors.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioState();
}

class _UsuarioState extends State<UsuarioPage> {
  var colorsClass = ColorsClass();
  var popUp = PopUp();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          popUp.PopUpCancel(context);
        }
      },

      child: Scaffold(
        appBar: AppBar(title: Text('Gestão de usuários')),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),

            child: Column(
              children: [
                FotoPerfilWidget(img: 'lib/app/assets/imgs/eu.png'),
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

                Container1Widget(
                  child: Form(
                    child: Column(
                      children: [
                        /// NOME
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Nome:', style: TextStyle(fontSize: 16)),
                        ),
                        SizedBox(height: 10),
                        Input1Widget(),
                        SizedBox(height: 20),

                        /// USUARIO
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Usuário:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Input1Widget(),
                        SizedBox(height: 20),

                        /// NIVEL
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nivel de acesso:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Input1Widget(),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Mudar senha',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5),
                Container1Widget(
                  child: Form(
                    child: Column(
                      children: [
                        /// NOME
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nova senha:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Input3Widget(),
                        SizedBox(height: 20),

                        /// USUARIO
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirmar nova senha:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Input3Widget(),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button1Widget(
                      txt: 'Salvar alterações',
                      onPressed: () {
                        popUp.PopUpAlterar(context);
                      },
                      tam: 160,
                    ),

                    SizedBox(width: 20),

                    Button1Widget(
                      txt: 'Excluir',
                      onPressed: () {
                        popUp.PopUpExcluir(context);
                      },
                      tam: 160,
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Button1Widget(
                  txt: 'Cancelar',
                  onPressed: () {
                    popUp.PopUpCancel(context);
                  },
                  tam: 160,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
