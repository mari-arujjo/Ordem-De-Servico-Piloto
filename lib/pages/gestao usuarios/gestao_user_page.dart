import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:ordem_de_servico/entidades/appuser/appuser_store.dart';
import 'package:ordem_de_servico/widgets/botoes/bt_lista_widget.dart';
import 'package:ordem_de_servico/widgets/botoes/flutuante_widget.dart';
import 'package:ordem_de_servico/widgets/inputs/search_widget.dart';
import 'package:ordem_de_servico/widgets/visualiza%C3%A7%C3%A3o/carregando_widget.dart';
import 'package:provider/provider.dart';

class GestaoUsuariosPage extends StatefulWidget {
  const GestaoUsuariosPage({super.key});

  @override
  State<GestaoUsuariosPage> createState() => _GestaoUsuariosPageState();
}

class _GestaoUsuariosPageState extends State<GestaoUsuariosPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask((){
      final store = context.read<AppUserStore>();
      store.getUsuarios();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);
    final store = context.watch<AppUserStore>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de usuários'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60), 
          child: SearchBarWidget(
            onSearch:(termo) => store.filtrarAppUser(termo)
          ),
        ),
      ),

      floatingActionButton: BotaoFlutuanteWidget(onPressed: () => context.goNamed('cadastroUsuarios')),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
      body: Builder(
        builder: (context){
          if(store.isLoading){
            return const Center(child: CarregandoWidget());
          }

          if(store.erro.isNotEmpty){
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

          if(store.appUser.isEmpty){
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
                      'Nenhum registro encontrado', 
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            );
          } else{
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
                      separatorBuilder: (_, _) => SizedBox(height: 12),
                      itemCount: store.appUser.length,
                      itemBuilder: (_, index) {  
                        final forn = store.appUser[index];
                        return ButtonLista(
                          txt: '@${forn.username} - ${forn.nome}', 
                          onPressed: (){
                          }
                        );
                      },
                    ),
                  )
                ),
              ),
            );
          }

        }
      ),

    );
  }
}