import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_icon_core_widget.dart';
import 'package:ordem_de_servico/UI/widgets/container_padrao_widget.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:provider/provider.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);
    int? corSelecionada = cor.corSelecionada;
    // 0-rosa, 1-azul, 2-verde, 3-vermelho, 4-roxo

    return Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ContainerPadrao(
                child: Column(
                  children: [
                    Text(
                      "Tema do app",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonCores(
                            selecionado: corSelecionada == 0,
                            corPrincipal: Color(0xFFFF4081),
                            corClick: Color.fromARGB(255, 163, 17, 71),
                            onPressed: () {
                              setState(() {
                                cor.setCorSelecionada(0);
                              });
                              cor.AtualizaPaleta(
                                terciary: Color(0xFFFF4081),
                                terciary_clear: Color.fromARGB(
                                  255,
                                  233,
                                  130,
                                  164,
                                ),
                                terciary_dark: Color.fromARGB(255, 163, 17, 71),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: ButtonCores(
                            selecionado: corSelecionada == 1,
                            corPrincipal: Color(0xFF448AFF),
                            corClick: Color.fromARGB(255, 11, 46, 143),
                            onPressed: () {
                              setState(() {
                                cor.setCorSelecionada(1);
                              });
                              cor.AtualizaPaleta(
                                terciary: Color(0xFF448AFF),
                                terciary_clear: Color.fromARGB(
                                  255,
                                  117,
                                  167,
                                  252,
                                ),
                                terciary_dark: Color.fromARGB(255, 11, 46, 143),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: ButtonCores(
                            selecionado: corSelecionada == 2,
                            corPrincipal: Color.fromARGB(255, 6, 165, 72),
                            corClick: Color.fromARGB(255, 6, 112, 31),
                            onPressed: () {
                              setState(() {
                                cor.setCorSelecionada(2);
                              });
                              cor.AtualizaPaleta(
                                terciary: Color.fromARGB(255, 6, 165, 72),
                                terciary_clear: Color.fromARGB(
                                  255,
                                  80,
                                  206,
                                  133,
                                ),
                                terciary_dark: Color.fromARGB(255, 6, 112, 31),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: ButtonCores(
                            selecionado: corSelecionada == 3,
                            corPrincipal: Color.fromARGB(255, 216, 17, 17),
                            corClick: Color.fromARGB(255, 165, 7, 7),
                            onPressed: () {
                              setState(() {
                                cor.setCorSelecionada(3);
                              });
                              cor.AtualizaPaleta(
                                terciary: Color.fromARGB(255, 216, 17, 17),
                                terciary_clear: Color.fromARGB(
                                  255,
                                  221,
                                  107,
                                  107,
                                ),
                                terciary_dark: Color.fromARGB(255, 165, 7, 7),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: ButtonCores(
                            selecionado: corSelecionada == 4,
                            corPrincipal: Color(0xFF7C4DFF),
                            corClick: Color.fromARGB(255, 84, 3, 199),
                            onPressed: () {
                              setState(() {
                                cor.setCorSelecionada(4);
                              });
                              cor.AtualizaPaleta(
                                terciary: Color(0xFF7C4DFF),
                                terciary_clear: Color.fromARGB(
                                  255,
                                  150,
                                  123,
                                  224,
                                ),
                                terciary_dark: Color.fromARGB(255, 84, 3, 199),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ContainerPadrao(child: Column(children: [Text("Sobre o app")])),
            ],
          ),
        ),
      ),
    );
  }
}
