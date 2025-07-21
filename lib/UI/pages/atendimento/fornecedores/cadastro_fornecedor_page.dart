import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/lista_uf_widget.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:provider/provider.dart';

class CadastroFornecedorPage extends StatefulWidget {
  const CadastroFornecedorPage({super.key});

  @override
  State<CadastroFornecedorPage> createState() => _CadastroFornecedorPageState();
}

class _CadastroFornecedorPageState extends State<CadastroFornecedorPage> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de fornecedores')),

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
                    color: cor.secundaria,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// CNPJ
                        Text('CNPJ:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(),
                        SizedBox(height: 20),

                        /// RAZÃO SOCIAL
                        Text('Razão social:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(),
                        SizedBox(height: 20),

                        /// EMAIL
                        Text('Email:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(),
                        SizedBox(height: 20),

                        /// TELEFONE
                        Text('Telefone:', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        InputPadrao(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cor.secundaria,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Rua:', style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 5),
                                  InputPadrao(),
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
                                  InputPadrao(),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),

                        /// BAIRRO
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Bairro:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 5),
                        InputPadrao(),
                        SizedBox(height: 20),

                        /// COMPLEMENTO
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Complemento:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 5),
                        InputPadrao(),
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
                                  InputPadrao(),
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
                                  /// UF
                                  Text(
                                    'Estado:',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  ListaUfWidget(
                                    txt: 'UF',
                                    onChanged: (value) {},
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
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
                  ButtonPadrao(txt: 'Salvar', onPressed: () async {}, tam: 150),

                  SizedBox(width: 20),

                  ButtonPadrao(txt: 'Cancelar', onPressed: () {}, tam: 150),
                ],
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
