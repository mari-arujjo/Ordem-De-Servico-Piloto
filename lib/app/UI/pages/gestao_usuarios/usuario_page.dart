import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/container_padrao_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/foto_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/inputs/ipt_padrao_senha_widget.dart';
import 'package:ordem_de_servico/app/src/controllers/gestao_usuarios_controller.dart';
import 'package:ordem_de_servico/app/src/helper/popup.dart';
import 'package:ordem_de_servico/app/assets/color/colors.dart';
import 'package:provider/provider.dart';

class UsuarioPage extends StatefulWidget {
  final int idUsuario;
  const UsuarioPage({super.key, required this.idUsuario});

  @override
  State<UsuarioPage> createState() => _UsuarioState();
}

class _UsuarioState extends State<UsuarioPage> {
  var colorsClass = ColorsClass();
  var popUp = PopUp();

  // ignore: prefer_typing_uninitialized_variables
  late final usuario;
  late TextEditingController nomeController;
  late TextEditingController usuarioController;
  late TextEditingController nivelController;

  @override
  void initState() {
    super.initState();
    final controller = context.read<GestaoUsuariosController>();
    final user = controller.allUsers.firstWhere((u) => u.id_usuario == widget.idUsuario);

    nomeController = TextEditingController(text: user.nome);
    usuarioController = TextEditingController(text: user.usuario);
    nivelController = TextEditingController(text: user.nivel_acesso.toString());
  }
  
  @override
  void dispose(){
    nomeController.dispose();
    usuarioController.dispose();
    nivelController.dispose();
    super.dispose();
  }

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
                FotoDePerfilWidget(img: usuario.foto!),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ID:', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 5),
                    Text('${usuario.id_usuario}'),
                  ],
                ),

                SizedBox(height: 20),

                ContainerPadrao(
                  child: Form(
                    child: Column(
                      children: [
                        /// NOME
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Nome:', style: TextStyle(fontSize: 16)),
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
                            'Nivel de acesso:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 5),
                        InputPadrao(controller: nivelController),
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
                ContainerPadrao(
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
                        SizedBox(height: 5),
                        InputPadraoSenha(),
                        SizedBox(height: 20),

                        /// USUARIO
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirmar nova senha:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 5),
                        InputPadraoSenha(),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonPadrao(
                      txt: 'Salvar alterações',
                      onPressed: () {
                        popUp.PopUpAlterar(context);
                      },
                      tam: 160,
                    ),

                    SizedBox(width: 20),

                    ButtonPadrao(
                      txt: 'Excluir',
                      onPressed: () {
                        popUp.PopUpExcluir(context);
                      },
                      tam: 160,
                    ),
                  ],
                ),

                SizedBox(height: 20),

                ButtonPadrao(
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
