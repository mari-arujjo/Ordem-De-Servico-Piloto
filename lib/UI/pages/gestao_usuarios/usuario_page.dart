// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/carregando_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_niveis_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/foto_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_senha_padrao_widget.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/helper/popup.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_model.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_repositorio.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_store.dart';
import 'package:provider/provider.dart';

class UsuarioPage extends StatefulWidget {
  final int idUsuario;
  const UsuarioPage({super.key, required this.idUsuario});

  @override
  State<UsuarioPage> createState() => _UsuarioState();
}

class _UsuarioState extends State<UsuarioPage> {
  var user;
  bool isLoading = true;
  var popUp = PopUp();
  late TextEditingController nomeController;
  late TextEditingController usuarioController;
  late TextEditingController senhaController;
  late TextEditingController confirmSenhaController;
  int? nivelSelecionado;

  @override
  void initState() {
    super.initState();
    carregarUser();
  }

  Future<void> carregarUser() async {
    final store = context.read<UsuarioStore>();
    await store.getUsuarios();

    final encontrado = store.usuario.firstWhere(
      (u) => u.id_usuario == widget.idUsuario,
      orElse: () => throw Exception('Usuário não encontrado.'),
    );

    setState(() {
      user = encontrado;
      nomeController = TextEditingController(text: user.nome);
      usuarioController = TextEditingController(text: user.usuario);
      senhaController = TextEditingController();
      confirmSenhaController = TextEditingController();
      isLoading = false;
      nivelSelecionado = user.nivel_acesso;
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    usuarioController.dispose();
    senhaController.dispose();
    confirmSenhaController.dispose();
    super.dispose();
  }

  File? img;
  bool mudouFoto = false;
  Uint8List? imgBytes;
  final picker = ImagePicker();
  pickImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        img = File(pickedFile.path);
        imgBytes = bytes;
        mudouFoto = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    if (isLoading) {
      return const Scaffold(body: Center(child: CarregandoWidget()));
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (usuarioController.text != user.usuario ||
              nomeController.text != user.nome ||
              nivelSelecionado != user.nivel_acesso ||
              senhaController.text != "" ||
              mudouFoto == true) {
            popUp.PopUpCancel(context);
          } else {
            context.pop();
          }
        }
      },

      child: Scaffold(
        appBar: AppBar(
          title: Text('@${user.usuario}'),
          actions: [
            IconButton(
              onPressed: () {
                context.goNamed(
                  'usuarioHistorico',
                  pathParameters: {'id': user.id_usuario.toString()},
                );
                print(user.id_usuario);
              },
              icon: Icon(Icons.history),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 30, left: 30, bottom: 30, top: 10),

            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    FotoDePerfilWidget(
                      imgFile: img,
                      imgBytes: imgBytes != null ? null : user.foto,
                    ),

                    IconButton(
                      onPressed: () {
                        pickImageGallery();
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ), // cor do ícone
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(WidgetState.pressed)) {
                              return cor.terciaria;
                            }
                            return cor.primaria;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

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
                        InputPadrao(controller: nomeController, maxLength: 50),

                        /// USUARIO
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Usuário:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 5),
                        InputPadrao(
                          controller: usuarioController,
                          maxLength: 15,
                        ),

                        /// NIVEL
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nivel de acesso:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 5),
                        ListaNiveisWidget(
                          txt: user.nivel_acesso.toString(),
                          onChanged: (value) {
                            nivelSelecionado = int.tryParse(
                              value?.split(' - ')[0] ?? '',
                            );
                            print('nivelSelecionado: $nivelSelecionado');
                          },
                        ),
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
                        /// NOVA SENHA
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nova senha:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 5),
                        InputPadraoSenha(
                          controller: senhaController,
                          maxLength: 20,
                        ),
                        SizedBox(height: 20),

                        /// CONFIRMAR NOVA SENHA
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirmar nova senha:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 5),
                        InputPadraoSenha(
                          controller: confirmSenhaController,
                          maxLength: 20,
                        ),
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
                        if (usuarioController.text == user.usuario &&
                            nomeController.text == user.nome &&
                            nivelSelecionado == user.nivel_acesso &&
                            senhaController.text == "" &&
                            mudouFoto == false) {
                          popUp.PopUpAlert(
                            context,
                            'Nenhum dado foi alterado.',
                          );
                        }

                        final confirmou = await popUp.PopUpAlterar(context);
                        if (confirmou != true) return;

                        final userAlt = UsuarioModel(
                          id_usuario: user.id_usuario,
                          usuario: usuarioController.text,
                          nome: nomeController.text,
                          nivel_acesso: nivelSelecionado!,
                          senha: senhaController.text,
                          foto: imgBytes ?? user.foto,
                        );

                        final repo = UsuarioRepositorio(client: HttpClient());
                        try {
                          await repo.alterarDadosDoUsuario(
                            context,
                            userAlt,
                            userAlt.id_usuario,
                          );

                          await repo.alterarFotoDoUsuario(
                            context,
                            userAlt,
                            userAlt.id_usuario,
                          );

                          await repo.alterarSenhaDoUsuario(
                            context,
                            userAlt,
                            userAlt.id_usuario,
                          );
                          //context.pop();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: const Text(
                                  'Dados alterados com sucesso.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                      context.pop();
                                    },
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(color: cor.terciaria),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } catch (e) {
                          throw Exception(e);
                        }
                      },
                      tam: 150,
                    ),

                    SizedBox(width: 20),

                    ButtonPadrao(
                      txt: 'Excluir',
                      onPressed: () async {
                        try {
                          final confirmou = await popUp.PopUpExcluir(context);
                          if (confirmou != true) return;
                          final repo = UsuarioRepositorio(client: HttpClient());
                          await repo.deletarUsuario(user.id_usuario);
                          context.pop();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: const Text(
                                  'Dados excluídos com sucesso.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                      context.pop();
                                    },
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(color: cor.terciaria),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } catch (e) {
                          popUp.PopUpAlert(context, e);
                        }
                      },
                      tam: 150,
                    ),
                  ],
                ),

                SizedBox(height: 20),

                ButtonPadrao(
                  txt: 'Cancelar',
                  onPressed: () {
                    if (usuarioController.text != user.usuario ||
                        nomeController.text != user.nome ||
                        nivelSelecionado != user.nivel_acesso ||
                        senhaController.text != "" ||
                        mudouFoto == true) {
                      popUp.PopUpCancel(context);
                    } else {
                      context.pop();
                    }
                  },
                  tam: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
