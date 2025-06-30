import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_senha_widget.dart';
import 'package:ordem_de_servico/UI/widgets/dropdown_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/src/helper/popup.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class CadastroUserPage extends StatefulWidget {
  const CadastroUserPage({super.key});

  @override
  State<CadastroUserPage> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUserPage> {
  bool isChecked = false;
  bool obscurePassword = true;
  bool isChecked2 = false;
  bool obscurePassword2 = true;
  final List<String> listNivel = [
    "1 - Administrador",
    "2 - Moderador",
    "3 - Padrão",
  ];
  var colorsClass = ColorsClass();
  var popUp = PopUp();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          popUp.PopUpCancel(context);
        }
      },

      child: Scaffold(
        appBar: AppBar(title: const Text('Cadastro de usuários')),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colorsClass.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Form(
                      child: Column(
                        children: [
                          /// NOME
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nome:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadrao(),
                          SizedBox(height: 20),

                          /// USUARIO
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Usuário:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadrao(),
                          SizedBox(height: 20),

                          /// NIVEL
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nível de acesso:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          DropdownWidget(
                            listNivel: listNivel,
                            txt: 'Selecione o nível de acesso ao sistema',
                          ),
                          SizedBox(height: 20),

                          /// SENHA
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Senha:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadraoSenha(),

                          SizedBox(height: 20),

                          /// CONFIMAR SENHA
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Confirmar senha:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadraoSenha(),
                        ],
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonPadrao(
                      txt: 'Salvar dados',
                      onPressed: () {
                        popUp.PopUpSalvar(context);
                      },
                      tam: 150,
                    ),

                    SizedBox(width: 20),

                    ButtonPadrao(
                      txt: 'Cancelar',
                      onPressed: () {
                        popUp.PopUpCancel(context);
                      },
                      tam: 150,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
