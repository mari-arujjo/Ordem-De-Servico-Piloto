import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_lista_widget.dart';
import 'package:ordem_de_servico/UI/widgets/carregando_widget.dart';
import 'package:ordem_de_servico/UI/widgets/flutuante_widget.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';
import 'package:ordem_de_servico/UI/widgets/search_widget.dart';
import 'package:ordem_de_servico/src/API/http_client.dart';
import 'package:ordem_de_servico/src/usuario/u_repository.dart';
import 'package:ordem_de_servico/src/usuario/u_store.dart';

class GestaoUsuariosPage extends StatefulWidget {
  const GestaoUsuariosPage({super.key});

  @override
  State<GestaoUsuariosPage> createState() => _GestaoUsuariosState();
}

class _GestaoUsuariosState extends State<GestaoUsuariosPage> {
  var colorsClass = ColorsClass();
  final UsuarioStore store = UsuarioStore(
    repositorio: UsuarioRepository(
      client: HttpClient()
    ),
  );

  @override
  void initState(){
    super.initState();
    store.getUsuarios();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Gestão de usuários')),

      floatingActionButton: BotaoFlutuanteWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.isLoading,
          store.erro,
          store.state,
        ]), 
        
        builder:(context, child) {
          if(store.isLoading.value){
            return Center(
              child: CarregandoWidget()
            );
          }

          if(store.erro.value.isNotEmpty){
            return Center(
              child: Text(
                store.erro.value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ),
            );
          }

          if(store.state.value.isEmpty){
            return Center(
              child: Text(
                'Nenhum registro encontrado.',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    
                    SearchBarWidget(/*onSearch: filtrarUsuarios*/),

                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: colorsClass.secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Scrollbar(
                          thumbVisibility: true,
                          radius: Radius.circular(10),

                          child: ListView.separated(
                            padding: EdgeInsets.only(
                              right: 15,
                              left: 15,
                              top: 10,
                              bottom: 12,
                            ),

                            itemCount: store.state.value.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12),
                            itemBuilder: (_, index) {
                              final user = store.state.value[index];
                              
                              return ButtonLista(
                                txt:
                                    '${user.id_usuario} - @${user.usuario} - ${user.nome}',
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
                  ],
                ),
              ),
            );
          } //else
        }
      ),

    );
  }
}
