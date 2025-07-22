import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_categorias_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_uf_widget.dart';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/entidades/fornecedor/f_model.dart';
import 'package:ordem_de_servico/src/entidades/fornecedor/f_repositorio.dart';
import 'package:ordem_de_servico/src/helper/popup.dart';

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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if(!didPop){
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
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Cadastro de fornecedores')),

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
                        InputPadrao(controller: cnpjController, hintText: 'XX.XXX.XXX/XXXX-XX'),
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
                        InputPadrao(controller: telefoneController, hintText: 'XX 9XXXX-XXXX'),
                        SizedBox(height: 20),

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
                                  InputPadrao(controller: cepController, hintText: 'XXXXX-XXX'),
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
                                    txt: '', 
                                    onChanged: (value) {
                                      setState(() {
                                        ufSelecionada = value;
                                      });
                                    }
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
                      onPressed: () async {
                        if (cnpjController.text.isEmpty ||
                            razaoController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            telefoneController.text.isEmpty ||
                            categoriaSelecionada == null ||
                            cepController.text.isEmpty ||
                            logradouroController.text.isEmpty ||
                            int.tryParse(numeroController.text) == null ||
                            bairroController.text.isEmpty ||
                            cidadeController.text.isEmpty ||
                            ufSelecionada == null) {
                          popUp.PopUpAlert(
                            context,
                            'Preencha os campos obrigatórios.',
                          );
                        }

                        final fornecedor = FornecedorModel(
                          id_fornecedor: 0, 
                          cnpj_fornecedor: cnpjController.text, 
                          razao_social: razaoController.text, 
                          email: emailController.text, 
                          telefone: telefoneController.text, 
                          categoria: categoriaSelecionada!, 
                          cep: cepController.text, 
                          rua: logradouroController.text, 
                          numero: int.parse(numeroController.text), 
                          bairro: bairroController.text, 
                          cidade: cidadeController.text, 
                          uf: ufSelecionada!
                        );
                        try{
                          final repo = FornecedorRepositorio(client: HttpClient());
                          await repo.cadastrarFornecedor(context, fornecedor);
                          popUp.PopUpSalvar(context);
                        }catch(e){
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
