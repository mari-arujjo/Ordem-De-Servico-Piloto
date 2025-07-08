import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_senha_widget.dart';
import 'package:ordem_de_servico/UI/widgets/dropdown_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/src/API/http_client.dart' show HttpClient;
import 'package:ordem_de_servico/src/helper/popup.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';
import 'package:ordem_de_servico/src/usuario/u_model.dart';
import 'package:ordem_de_servico/src/usuario/u_repository.dart';

class CadastroUserPage extends StatefulWidget {
  const CadastroUserPage({super.key});

  @override
  State<CadastroUserPage> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUserPage> {
  var colorsClass = ColorsClass();
  var popUp = PopUp();
  bool isChecked = false;
  bool obscurePassword = true;
  bool isChecked2 = false;
  bool obscurePassword2 = true;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmSenhaController = TextEditingController();
  int? nivelSelecionado;
  final List<String> listNivel = [
    "1 - Administrador",
    "2 - Moderador",
    "3 - Padrão",
  ];
  

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
                          InputPadrao(controller: nomeController),
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
                          InputPadrao(controller: usuarioController),
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
                            onChanged: (value) {
                              nivelSelecionado = int.tryParse(value?.split(' - ')[0] ?? '');
                              print('nivelSelecionado: $nivelSelecionado');
                            },
                          
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
                          InputPadraoSenha(controller: senhaController),

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
                          InputPadraoSenha(controller: confirmSenhaController),
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
                      onPressed: () async {
                        if (nivelSelecionado == null) {
                          popUp.PopUpErro(context, 'Selecione o nível de acesso!');
                          return;
                        }
                        final user = UsuarioModel(
                          id_usuario: 0, 
                          usuario: usuarioController.text, 
                          nome: nomeController.text, 
                          nivel_acesso: nivelSelecionado!,
                          senha: senhaController.text,
                        );

                        try{
                          final repo = UsuarioRepository(client: HttpClient());
                          await repo.cadastrarUsuario(user);
                          popUp.PopUpSalvar(context);
                          Navigator.pop(context);
                        } catch (e) {
                          popUp.PopUpErro(context, e);
                        }
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
