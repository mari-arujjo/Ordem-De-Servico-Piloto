import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/botoes/bt_lista_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/flutuante_widget.dart';
import 'package:ordem_de_servico/app/assets/color/colors.dart';
import 'package:ordem_de_servico/app/UI/widgets/search_widget.dart';
//import 'package:provider/provider.dart';

class GestaoUsuariosPage extends StatefulWidget {
  const GestaoUsuariosPage({super.key});

  @override
  State<GestaoUsuariosPage> createState() => _GestaoUsuariosState();
}

class _GestaoUsuariosState extends State<GestaoUsuariosPage> {
  var colorsClass = ColorsClass();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Gestão de usuários')),

      floatingActionButton: BotaoFlutuanteWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Center(
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

                      itemCount: 1,
                      separatorBuilder: (_, __) => SizedBox(height: 12),
                      itemBuilder: (BuildContext context, int i) {
                        //final user = controller.filteredUsers[i];
                        
                        return ButtonLista(
                          txt:
                              'A',//'${user.id_usuario} - @${user.usuario} - ${user.nome}',
                          onPressed: () {
                            context.goNamed(
                              'usuarioDetalhe',
                              pathParameters: {
                                //'id': controller.filteredUsers[i].id_usuario.toString(),
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
      ),
    );
  }
}
