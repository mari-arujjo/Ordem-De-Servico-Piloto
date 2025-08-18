import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:ordem_de_servico/src/entidades/appuser/appuser_store.dart';
import 'package:ordem_de_servico/widgets/botoes/bt_icon_txt_widget.dart';
import 'package:ordem_de_servico/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_de_servico/widgets/visualiza%C3%A7%C3%A3o/carregando_widget.dart';
import 'package:ordem_de_servico/widgets/visualiza%C3%A7%C3%A3o/container_padrao_widget.dart';
import 'package:ordem_de_servico/widgets/visualiza%C3%A7%C3%A3o/foto_widget.dart';
import 'package:provider/provider.dart';

class MeuPerfilPage extends StatefulWidget {
  const MeuPerfilPage({super.key});

  @override
  State<MeuPerfilPage> createState() => _MeuPerfilPageState();
}

class _MeuPerfilPageState extends State<MeuPerfilPage> {
  get popUpSair => null;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final store = context.read<AppUserStore>();
      store.getUsuarios();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);
    final store = context.watch<AppUserStore>();

    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),

      body: Builder(
        builder: (context) {
          if (store.isLoading) {
            return const Center(child: CarregandoWidget());
          }

          if (store.erro.isNotEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  store.erro,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            );
          }

          if (store.appUser.isEmpty) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),

                    Text(
                      'Você ainda não está logado.',
                      style: TextStyle(fontSize: 18),
                    ),

                    Image.asset(
                      "lib/assets/imgs/robo_quebrado.jpg",
                      height: 350,
                      width: 350,
                    ),

                    SizedBox(height: 30),
                    ButtonComIconTexto(
                      txt: 'Fazer login',
                      onPressed: () {
                        context.push(context.namedLocation("Login"));
                      },
                      tam: 190,
                      ico: Icon(Icons.login, color: Colors.white),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          FotoDePerfilWidget(img: 'lib/assets/imgs/eu.png'),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                cor.primaria,
                              ),
                              iconColor: WidgetStatePropertyAll(Colors.white),
                              overlayColor: WidgetStatePropertyAll(
                                cor.terciaria_escuro,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),

                      ContainerPadrao(
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nome:', style: TextStyle(fontSize: 16)),
                              SizedBox(height: 5),
                              InputPadrao(),
                              SizedBox(height: 20),
                              Text('Usuário:', style: TextStyle(fontSize: 16)),
                              SizedBox(height: 5),
                              InputPadrao(),
                              SizedBox(height: 20),
                              Text('Email:', style: TextStyle(fontSize: 16)),
                              SizedBox(height: 5),
                              InputPadrao(),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Mudar senha:',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      ContainerPadrao(
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nome:', style: TextStyle(fontSize: 16)),
                              SizedBox(height: 5),
                              InputPadrao(),
                              SizedBox(height: 20),
                              Text('Usuário:', style: TextStyle(fontSize: 16)),
                              SizedBox(height: 5),
                              InputPadrao(),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      ButtonComIconTexto(
                        txt: 'Logout',
                        onPressed: () {
                          popUpSair.PopUpSair(context);
                        },
                        tam: 140,
                        ico: Icon(Icons.logout, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
