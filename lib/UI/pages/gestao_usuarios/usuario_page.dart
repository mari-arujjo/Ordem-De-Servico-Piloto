import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/carregando_widget.dart';
import 'package:ordem_de_servico/UI/widgets/container_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/foto_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_senha_widget.dart';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/helper/popup.dart';
import 'package:ordem_de_servico/src/usuario/u_repository.dart';
import 'package:ordem_de_servico/src/usuario/u_store.dart';

class UsuarioPage extends StatefulWidget {
  final int idUsuario;
  const UsuarioPage({super.key, required this.idUsuario});

  @override
  State<UsuarioPage> createState() => _UsuarioState();
}

class _UsuarioState extends State<UsuarioPage> {
  // ignore: prefer_typing_uninitialized_variables
  var user;
  bool isLoading = true;
  var popUp = PopUp();
  late TextEditingController nomeController;
  late TextEditingController usuarioController;
  late TextEditingController nivelController;
  late TextEditingController senhaController;
  late TextEditingController confirmSenhaController;
  final UsuarioStore store = UsuarioStore(
    repositorio: UsuarioRepository(client: HttpClient()),
  );

  @override
  void initState() {
    super.initState();
    carregarUser();
  }

  Future<void> carregarUser() async {
    await store.getUsuarios();

    final encontrado = store.state.value.firstWhere(
      (u) => u.id_usuario == widget.idUsuario,
      orElse: () => throw Exception('Usuário não encontrado.'),
    );

    setState(() {
      user = encontrado;
      nomeController = TextEditingController(text: user.nome);
      usuarioController = TextEditingController(text: user.usuario);
      nivelController = TextEditingController(text: user.nivel_acesso.toString(),);
      isLoading = false;
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    usuarioController.dispose();
    nivelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CarregandoWidget()));
    }

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
                FotoDePerfilWidget(img: user.foto_url),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ID:', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 5),
                    Text('${user.id_usuario}'),
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
