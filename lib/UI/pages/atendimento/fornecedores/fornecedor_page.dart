import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_cep_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_cnpj_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_telefone_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/carregando_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_categorias_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_uf_widget.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/entidades/fornecedor/f_model.dart';
import 'package:ordem_de_servico/src/entidades/fornecedor/f_repositorio.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarFornecedor();
    });
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
    final cor = Provider.of<CoresClass>(context);

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
              complementoController.text != fornecedor.complemento ||
              cidadeController.text != fornecedor.cidade ||
              ufSelecionada != fornecedor.uf) {
            popUp.PopUpCancel(context);
          } else {
            context.pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Detalhes')),
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
                        /// CNPJ
                        Text('CNPJ:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputCNPJ(controller: cnpjController),

                        /// RAZÃO SOCIAL
                        Text('Razão social:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(controller: razaoController, maxLength: 50),

                        /// EMAIL
                        Text('Email:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(
                          controller: emailController,
                          maxLength: 100,
                        ),

                        /// TELEFONE
                        Text('Telefone:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputTelefone(controller: telefoneController),

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
                                  InputCEP(controller: cepController),
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
                                  InputPadrao(
                                    controller: numeroController,
                                    maxLength: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        /// LOGRADOURO
                        Text('Logradouro:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(
                          controller: logradouroController,
                          maxLength: 50,
                        ),

                        /// BAIRRO
                        Text('Bairro:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(
                          controller: bairroController,
                          maxLength: 50,
                        ),

                        /// COMPLEMENTO
                        Text('Complemento:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(
                          controller: complementoController,
                          maxLength: 50,
                        ),

                        Text('Cidade:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(
                          controller: cidadeController,
                          maxLength: 50,
                        ),

                        SizedBox(width: 10),

                        /// UF
                        Text('Estado:', style: TextStyle(fontSize: 16)),
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
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonPadrao(
                      txt: 'Salvar',
                      onPressed: () async {
                        if (cnpjController.text == fornecedor.cnpj_fornecedor &&
                            razaoController.text == fornecedor.razao_social &&
                            emailController.text == fornecedor.email &&
                            telefoneController.text == fornecedor.telefone &&
                            categoriaSelecionada == fornecedor.categoria &&
                            cepController.text == fornecedor.cep &&
                            logradouroController.text ==
                                fornecedor.logradouro &&
                            int.parse(numeroController.text) ==
                                fornecedor.numero &&
                            bairroController.text == fornecedor.bairro &&
                            complementoController.text ==
                                fornecedor.complemento &&
                            cidadeController.text == fornecedor.cidade &&
                            ufSelecionada == fornecedor.uf) {
                          popUp.PopUpAlert(
                            context,
                            'Nenhum dado foi alterado.',
                          );
                          return;
                        }

                        final confirmou = await popUp.PopUpAlterar(context);
                        if (confirmou != true) return;

                        final fornAlt = FornecedorModel(
                          id_fornecedor: fornecedor.id_fornecedor,
                          cnpj_fornecedor: cnpjController.text,
                          razao_social: razaoController.text,
                          email: emailController.text,
                          telefone: telefoneController.text,
                          categoria: categoriaSelecionada!,
                          cep: cepController.text,
                          logradouro: logradouroController.text,
                          numero: int.parse(numeroController.text),
                          bairro: bairroController.text,
                          complemento: complementoController.text,
                          cidade: cidadeController.text,
                          uf: ufSelecionada!,
                        );
                        final repo = FornecedorRepositorio(
                          client: HttpClient(),
                        );
                        try {
                          await repo.alterarDadosDoFornecedor(
                            context,
                            fornAlt,
                            fornAlt.id_fornecedor,
                          );
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
                          final repo = FornecedorRepositorio(
                            client: HttpClient(),
                          );
                          await repo.deletarFornecedor(
                            fornecedor.id_fornecedor,
                          );
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
                        complementoController.text != fornecedor.complemento ||
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
