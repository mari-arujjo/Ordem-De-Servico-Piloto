import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_lista_widget.dart';
import 'package:ordem_de_servico/UI/widgets/carregando_widget.dart';
import 'package:ordem_de_servico/UI/widgets/flutuante_widget.dart';
import 'package:ordem_de_servico/UI/widgets/search_widget.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:ordem_de_servico/src/entidades/fornecedor/f_store.dart';
import 'package:provider/provider.dart';

class GestaoFornecedoresPage extends StatefulWidget {
  const GestaoFornecedoresPage({super.key});

  @override
  State<GestaoFornecedoresPage> createState() => _GestaoFornecedoresPageState();
}

class _GestaoFornecedoresPageState extends State<GestaoFornecedoresPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState(){
    super.initState();
    Future.microtask((){
      final store = context.read<FornecedorStore>();
      store.getFornecedores();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);
    final store = context.watch<FornecedorStore>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de fornecedores'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchBarWidget(
            onSearch: (termo) => store.filtrarFornecedores(termo)
          ),
        ),
      ),

      floatingActionButton: BotaoFlutuanteWidget(onPressed: () => context.goNamed('cadastroFornecedor')),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Builder(
        builder: (context) {
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

          if(store.fornecedor.isEmpty){
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
                      separatorBuilder: (_, __) => SizedBox(height: 12),
                      itemCount: store.fornecedor.length,
                      itemBuilder: (_, index) {  
                        final forn = store.fornecedor[index];
                        return ButtonLista(
                          txt: '${forn.cnpj_fornecedor} - ${forn.razao_social}', 
                          onPressed: (){
                            context.goNamed(
                              'fornecedorDetalhe',
                              pathParameters: {
                                'id': forn.id_fornecedor.toString()
                              },
                            );
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
