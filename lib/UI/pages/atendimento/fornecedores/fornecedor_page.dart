import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_categorias_widget.dart';
import 'package:ordem_de_servico/UI/widgets/listas/lista_uf_widget.dart';

class FornecedorPage extends StatefulWidget {
  final int idUsuario;
  const FornecedorPage({super.key, required this.idUsuario});

  @override
  State<FornecedorPage> createState() => _FornecedorPageState();
}

class _FornecedorPageState extends State<FornecedorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                      ///CATEGORIA
                      Text('Categoria:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      ListaCategoriasWidget(txt: 'Selecione a categoria', onChanged: (value) {}),
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
                                Text('Número:', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                InputPadrao(),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),

                      /// LOGRADOURO
                      Text('Logradouro:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadrao(),
                      SizedBox(height: 20),

                      /// BAIRRO
                      Text('Bairro:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadrao(),
                      SizedBox(height: 20),

                      /// COMPLEMENTO
                      Text('Complemento:', style: TextStyle(fontSize: 16)),
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
                                Text('Cidade:', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                InputPadrao(),
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
                                Text('Estado:', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                ListaUfWidget(txt: 'UF', onChanged: (value) {}),
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
                  ButtonPadrao(txt: 'Salvar', onPressed: () async {}, tam: 150),

                  SizedBox(width: 20),

                  ButtonPadrao(txt: 'Excluir', onPressed: () {}, tam: 150),
                ],
              ),
              SizedBox(height: 20),
              ButtonPadrao(txt: 'Cancelar', onPressed: () {}, tam: 150),
            ],
          ),
        ),
      ),
    );
  }
}
