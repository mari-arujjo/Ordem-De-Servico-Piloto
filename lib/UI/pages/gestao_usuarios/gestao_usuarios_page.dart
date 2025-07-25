import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_lista_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/carregando_widget.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/flutuante_widget.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:ordem_de_servico/UI/widgets/inputs/search_widget.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_store.dart';
import 'package:provider/provider.dart';

class GestaoUsuariosPage extends StatefulWidget {
  const GestaoUsuariosPage({super.key});

  @override
  State<GestaoUsuariosPage> createState() => _GestaoUsuariosState();
}

class _GestaoUsuariosState extends State<GestaoUsuariosPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask((){
      final store = context.read<UsuarioStore>();
      store.getUsuarios();
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);
    final store = context.watch<UsuarioStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestão de usuários'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchBarWidget(
            onSearch: (termo) => store.filtrarUsuarios(termo),
          ),
        ),
      ),

      floatingActionButton: BotaoFlutuanteWidget(onPressed: () => context.goNamed('cadastroUsuario')),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Builder(
        builder: (context) {
          if (store.isLoading) {
            return Center(child: CarregandoWidget());
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

          if (store.usuario.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10,bottom: 20,left: 20,right: 20),
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: cor.secundaria,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Nenhum registro encontrado.',
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10,bottom: 20,left: 20,right: 20),
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: cor.secundaria,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Scrollbar(
                    controller: scrollController,
                    thumbVisibility: true,
                    radius: Radius.circular(10),

                    child: ListView.separated(
                      controller: scrollController,
                      padding: EdgeInsets.only(right: 15,left: 15,top: 10,bottom: 12),
                      itemCount: store.usuario.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12),
                      itemBuilder: (_, index) {
                        final user = store.usuario[index];
                        return ButtonLista(
                          txt: '${user.id_usuario} - @${user.usuario} - ${user.nome}',
                          onPressed: () {
                            context.goNamed(
                              'usuarioDetalhe',
                              pathParameters: {
                                'id': user.id_usuario.toString(),
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          } //else
        },
      ),
    );
  }
}
