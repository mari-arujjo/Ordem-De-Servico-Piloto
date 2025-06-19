import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/com%20varia%C3%A7%C3%B5es/button1_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/dropdown_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/com%20varia%C3%A7%C3%B5es/input1_widget.dart';
import 'package:ordem_de_servico/app/src/helper/popup.dart';
import 'package:ordem_de_servico/colors.dart';

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
                          Input1Widget(obscure: false),
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
                          Input1Widget(obscure: false),
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
                          Row(
                            children: [
                              Expanded(
                                child: Input1Widget(obscure: obscurePassword),
                              ),
                              Checkbox(
                                activeColor: colorsClass.terciaryColor,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                    obscurePassword = !isChecked;
                                  });
                                },
                              ),
                            ],
                          ),
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
                          Row(
                            children: [
                              Expanded(
                                child: Input1Widget(obscure: obscurePassword2),
                              ),
                              Checkbox(
                                activeColor: colorsClass.terciaryColor,
                                value: isChecked2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked2 = value!;
                                    obscurePassword2 = !isChecked2;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button1Widget(
                      txt: 'Salvar dados',
                      onPressed: () {
                        popUp.PopUpSalvar(context);
                      },
                      tam: 150,
                    ),

                    SizedBox(width: 20),

                    Button1Widget(
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
