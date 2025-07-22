import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/carregando_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_categorias_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_uf_widget.dart';
import 'package:ordem_de_servico/src/entidades/fornecedor/f_store.dart';
import 'package:ordem_de_servico/src/helper/popup.dart';
import 'package:provider/provider.dart';

class FornecedorPage extends StatefulWidget {
  final int idFornecedor;
  const FornecedorPage({super.key, required this.idFornecedor});

  @override
  State<FornecedorPage> createState() => _FornecedorPageState();
}

class _FornecedorPageState extends State<FornecedorPage> {
  var fornecedor;
  bool isLoading = true;
  var popUp = PopUp();
  late TextEditingController cnpjController;
  late TextEditingController razaoController;
  late TextEditingController emailController;
  late TextEditingController telefoneController;
  late TextEditingController cepController;
  late TextEditingController logradouroController;
  late TextEditingController numeroController;
  late TextEditingController complementoController;
  late TextEditingController bairroController;
  late TextEditingController cidadeController;
  String? categoriaSelecionada;
  String? ufSelecionada;

  @override
  void initState() {
    super.initState();
    carregarFornecedor();
  }

  Future<void> carregarFornecedor() async {
    final store = context.read<FornecedorStore>();
    await store.getFornecedores();

    final encontrado = store.fornecedor.firstWhere(
      (f) => f.id_fornecedor == widget.idFornecedor,
      orElse: () => throw Exception('Fornecedor não encontrado'),
    );

    setState(() {
      fornecedor = encontrado;
      cnpjController = TextEditingController(text: fornecedor.cnpj_fornecedor);
      razaoController = TextEditingController(text: fornecedor.razao_social);
      emailController = TextEditingController(text: fornecedor.email);
      telefoneController = TextEditingController(text: fornecedor.telefone);
      cepController = TextEditingController(text: fornecedor.cep);
      logradouroController = TextEditingController(text: fornecedor.logradouro);
      numeroController = TextEditingController(
        text: fornecedor.numero.toString(),
      );
      complementoController = TextEditingController(
        text: fornecedor.complemento,
      );
      bairroController = TextEditingController(text: fornecedor.bairro);
      cidadeController = TextEditingController(text: fornecedor.cidade);
      categoriaSelecionada = fornecedor.categoria;
      ufSelecionada = fornecedor.uf;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    cnpjController.dispose();
    razaoController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    cepController.dispose();
    logradouroController.dispose();
    numeroController.dispose();
    complementoController.dispose();
    bairroController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CarregandoWidget()));
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          if (cnpjController.text != fornecedor.cnpj_fornecedor ||
              razaoController.text != fornecedor.razao_social ||
              emailController.text != fornecedor.email ||
              telefoneController.text != fornecedor.telefone ||
              categoriaSelecionada != fornecedor.categoria ||
              cepController.text != fornecedor.cep ||
              logradouroController.text != fornecedor.logradouro ||
              int.tryParse(numeroController.text) != fornecedor.numero ||
              bairroController.text != fornecedor.bairro ||
              cidadeController.text != fornecedor.cidade ||
              ufSelecionada != fornecedor.uf) {
            popUp.PopUpCancel(context);
          } else {
            context.pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Detalhes do fornecedor')),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 50, top: 20),
            child: Column(
              children: [
                ContainerPadrao(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// CNPJ
                        Text('CNPJ:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: cnpjController),
                        SizedBox(height: 20),

                        /// RAZÃO SOCIAL
                        Text('Razão social:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: razaoController),
                        SizedBox(height: 20),

                        /// EMAIL
                        Text('Email:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: emailController),
                        SizedBox(height: 20),

                        /// TELEFONE
                        Text('Telefone:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: telefoneController),
                        SizedBox(height: 20),

                        ///CATEGORIA
                        Text('Categoria:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        ListaCategoriasWidget(
                          txt: fornecedor.categoria,
                          onChanged: (value) {
                            setState(() {
                              categoriaSelecionada = value;
                            });
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
                    'Endereço',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5),

                ContainerPadrao(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('CEP:', style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 5),
                                  InputPadrao(controller: cepController),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// NUMERO
                                  Text(
                                    'Número:',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  InputPadrao(controller: numeroController),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),

                        /// LOGRADOURO
                        Text('Logradouro:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: logradouroController),
                        SizedBox(height: 20),

                        /// BAIRRO
                        Text('Bairro:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: bairroController),
                        SizedBox(height: 20),

                        /// COMPLEMENTO
                        Text('Complemento:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: complementoController),
                        SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// CIDADE
                                  Text(
                                    'Cidade:',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  InputPadrao(controller: cidadeController),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// UF
                                  Text(
                                    'Estado:',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  ListaUfWidget(
                                    txt: fornecedor.uf,
                                    onChanged: (value) {
                                      setState(() {
                                        ufSelecionada = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                      onPressed: () async {},
                      tam: 150,
                    ),

                    SizedBox(width: 20),

                    ButtonPadrao(txt: 'Excluir', onPressed: () {}, tam: 150),
                  ],
                ),
                SizedBox(height: 20),
                ButtonPadrao(
                  txt: 'Cancelar',
                  onPressed: () {
                    if (cnpjController.text != fornecedor.cnpj_fornecedor ||
                        razaoController.text != fornecedor.razao_social ||
                        emailController.text != fornecedor.email ||
                        telefoneController.text != fornecedor.telefone ||
                        categoriaSelecionada != fornecedor.categoria ||
                        cepController.text != fornecedor.cep ||
                        logradouroController.text != fornecedor.logradouro ||
                        int.tryParse(numeroController.text) !=
                            fornecedor.numero ||
                        bairroController.text != fornecedor.bairro ||
                        cidadeController.text != fornecedor.cidade ||
                        ufSelecionada != fornecedor.uf) {
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
