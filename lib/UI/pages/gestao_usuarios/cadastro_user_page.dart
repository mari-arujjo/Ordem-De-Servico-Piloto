// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_senha_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_niveis_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/src/API/http_client.dart' show HttpClient;
import 'package:ordem_de_servico/src/helper/popup.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_model.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_repositorio.dart';

class CadastroUserPage extends StatefulWidget {
  const CadastroUserPage({super.key});

  @override
  State<CadastroUserPage> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUserPage> {
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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          if (usuarioController.text.isNotEmpty ||
              nomeController.text.isNotEmpty ||
              usuarioController.text.isNotEmpty ||
              nivelSelecionado != null ||
              senhaController.text.isNotEmpty ||
              confirmSenhaController.text.isNotEmpty) {
            popUp.PopUpCancel(context);
          } else {
            context.pop();
          }
        }
      },

      child: Scaffold(
        appBar: AppBar(title: const Text('Cadastro de usuários')),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 20),
            child: Column(
              children: [
                ContainerPadrao(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// NOME
                        Text('Nome:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: nomeController),
                        SizedBox(height: 20),

                        /// USUARIO
                        Text('Usuário:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: usuarioController),
                        SizedBox(height: 20),

                        /// NIVEL
                        Text(
                          'Nível de acesso:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        ListaNiveisWidget(
                          txt: 'Selecione o nível de acesso ao sistema',
                          onChanged: (value) {
                            nivelSelecionado = int.tryParse(
                              value?.split(' - ')[0] ?? '',
                            );
                            print('nivelSelecionado: $nivelSelecionado');
                          },
                        ),
                        SizedBox(height: 20),

                        /// SENHA
                        Text('Senha:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadraoSenha(controller: senhaController),

                        SizedBox(height: 20),

                        /// CONFIMAR SENHA
                        Text(
                          'Confirmar senha:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        InputPadraoSenha(controller: confirmSenhaController),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonPadrao(
                      txt: 'Salvar',
                      onPressed: () async {
                        if (nomeController.text.isEmpty |
                            usuarioController.text.isEmpty |
                            senhaController.text.isEmpty |
                            confirmSenhaController.text.isEmpty) {
                          popUp.PopUpAlert(
                            context,
                            'Preencha os campos obrigatórios.',
                          );
                          return;
                        }
                        if (nivelSelecionado == null) {
                          popUp.PopUpAlert(
                            context,
                            'Selecione o nível de acesso!',
                          );
                          return;
                        }
                        if (senhaController.text !=  
                            confirmSenhaController.text) {
                          popUp.PopUpAlert(context, 'Senhas divergentes!');
                          return;
                        }

                        final user = UsuarioModel(
                          id_usuario: 0,
                          usuario: usuarioController.text,
                          nome: nomeController.text,
                          nivel_acesso: nivelSelecionado!,
                          senha: senhaController.text,
                          foto: null,
                        );
                        try {
                          final repo = UsuarioRepositorio(client: HttpClient());
                          await repo.cadastrarUsuario(context, user);
                          popUp.PopUpSalvar(context);
                        } catch (e) {
                          popUp.PopUpAlert(context, e);
                          throw Exception(e);
                        }
                      },
                      tam: 150,
                    ),

                    SizedBox(width: 20),

                    ButtonPadrao(
                      txt: 'Cancelar',
                      onPressed: () {
                        if (usuarioController.text.isNotEmpty ||
                            nomeController.text.isNotEmpty ||
                            usuarioController.text.isNotEmpty ||
                            nivelSelecionado != null ||
                            senhaController.text.isNotEmpty ||
                            confirmSenhaController.text.isNotEmpty) {
                          popUp.PopUpCancel(context);
                        } else {
                          context.pop();
                        }
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
