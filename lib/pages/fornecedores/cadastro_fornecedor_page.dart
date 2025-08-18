import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/widgets/inputs/ipt_cep_widget.dart';
import 'package:ordem_de_servico/widgets/inputs/ipt_cnpj_widget.dart';
import 'package:ordem_de_servico/widgets/inputs/ipt_telefone_widget.dart';
import 'package:ordem_de_servico/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/widgets/listas/lista_categorias_widget.dart';
import 'package:ordem_de_servico/widgets/listas/lista_uf_widget.dart';
import 'package:ordem_de_servico/API/http_client.dart';
import 'package:ordem_de_servico/entidades/fornecedor/f_model.dart';
import 'package:ordem_de_servico/entidades/fornecedor/f_repositorio.dart';
import 'package:ordem_de_servico/popup.dart';

class CadastroFornecedorPage extends StatefulWidget {
  const CadastroFornecedorPage({super.key});

  @override
  State<CadastroFornecedorPage> createState() => _CadastroFornecedorPageState();
}

class _CadastroFornecedorPageState extends State<CadastroFornecedorPage> {
  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController razaoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController logradouroController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final PopUp popUp = PopUp();
  String? categoriaSelecionada;
  String? ufSelecionada;

  void condicoesVoltar() {
    if (cnpjController.text.isNotEmpty ||
        razaoController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        telefoneController.text.isNotEmpty ||
        categoriaSelecionada != null ||
        cepController.text.isNotEmpty ||
        logradouroController.text.isNotEmpty ||
        numeroController.text.isNotEmpty ||
        bairroController.text.isNotEmpty ||
        cidadeController.text.isNotEmpty ||
        ufSelecionada != null) {
      popUp.PopUpCancel(context);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          condicoesVoltar();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Cadastro de fornecedores')),

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
                          txt: 'Selecione a categoria',
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
                          txt: 'Selecione a UF',
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
                        if (cnpjController.text.isEmpty ||
                            razaoController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            telefoneController.text.isEmpty ||
                            categoriaSelecionada == null ||
                            cepController.text.isEmpty ||
                            logradouroController.text.isEmpty ||
                            numeroController.text.isEmpty ||
                            bairroController.text.isEmpty ||
                            cidadeController.text.isEmpty ||
                            ufSelecionada == null) {
                          popUp.PopUpAlert(
                            context,
                            'Preencha os campos obrigatórios.',
                          );
                          return;
                        }

                        if (int.tryParse(numeroController.text) == null) {
                          popUp.PopUpAlert(
                            context,
                            'Digite um número inteiro válido.',
                          );
                          return;
                        }

                        final fornecedor = FornecedorModel(
                          id_fornecedor: 0,
                          cnpj_fornecedor: cnpjController.text,
                          razao_social: razaoController.text,
                          email: emailController.text,
                          telefone: telefoneController.text,
                          categoria: categoriaSelecionada!,
                          cep: cepController.text,
                          logradouro: logradouroController.text,
                          numero: int.parse(numeroController.text),
                          bairro: bairroController.text,
                          cidade: cidadeController.text,
                          uf: ufSelecionada!,
                        );
                        try {
                          final repo = FornecedorRepositorio(
                            client: HttpClient(),
                          );
                          await repo.cadastrarFornecedor(context, fornecedor);
                          popUp.PopUpSalvar(context);
                        } catch (e) {
                          popUp.PopUpAlert(context, e);
                          //throw Exception(e);
                        }
                      },
                      tam: 150,
                    ),

                    SizedBox(width: 20),

                    ButtonPadrao(
                      txt: 'Cancelar',
                      onPressed: () {
                        condicoesVoltar();
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
