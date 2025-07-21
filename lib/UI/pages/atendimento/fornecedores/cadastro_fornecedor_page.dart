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
      appBar: AppBar(
        title: Text('Cadastro de fornecedores'),
      ),

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
                        children: [
                          /// CNPJ
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'CNPJ:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadrao(),
                          SizedBox(height: 20),

                          /// RAZÃO SOCIAL
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Razão social:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadrao(),
                          SizedBox(height: 20),

                          /// EMAIL
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadrao(),
                          SizedBox(height: 20),

                          /// TELEFONE
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Telefone:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadrao(),
                          SizedBox(height: 20),

                          Divider(
                            color: cor.primaria,
                          ),
                          SizedBox(height: 10),

                          /// RUA
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Rua:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadrao(),
                          SizedBox(height: 20),

                          /// NUMERO
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Número:',
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
                          SizedBox(height: 20),

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

                          /// CIDADE
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Cidade:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          InputPadrao(),
                          SizedBox(height: 20),

                          /// UF
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Estado:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5),
                          ListaUfWidget(
                            txt: 'Selecione a UF',
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonPadrao(
                      txt: 'Salvar',
                      onPressed: () async {},
                      tam: 150,
                    ),

                    SizedBox(width: 20),

                    ButtonPadrao(
                      txt: 'Cancelar',
                      onPressed: () {},
                    
                      tam: 150,
                    ),
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