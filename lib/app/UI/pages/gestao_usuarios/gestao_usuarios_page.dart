import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/variacoes/button2_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/flutuante_widget.dart';
import 'package:ordem_de_servico/app/src/models/usuario_model.dart';
import 'package:ordem_de_servico/colors.dart';
import 'package:ordem_de_servico/app/UI/widgets/search_widget.dart';
import 'package:ordem_de_servico/app/src/controllers/gestao_usuarios_controller.dart';

class GestaoUsuariosPage extends StatefulWidget {
  const GestaoUsuariosPage({super.key});

  @override
  State<GestaoUsuariosPage> createState() => _GestaoUsuariosState();
}

class _GestaoUsuariosState extends State<GestaoUsuariosPage> {
  var controller = GestaoUsuariosController();
  var colorsClass = ColorsClass();
  List<Usuario> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = controller.allUsers; // Inicializa com todos os usuários
  }

  void filtrarUsuarios(String textSearch){
    setState(() {
      filteredUsers = controller.allUsers.where((usuario){
        return usuario.usuario.toLowerCase().contains(textSearch.toLowerCase()) ||
              usuario.nome.toLowerCase().contains(textSearch.toLowerCase()) ||
              usuario.id_usuario.toString().contains(textSearch);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestão de usuários')),

      floatingActionButton: FlutuanteWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
          child: Column(
            children: [
              
              SearchBarWidget(onSearch: filtrarUsuarios),

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

                      itemCount: filteredUsers.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12),
                      itemBuilder: (BuildContext context, int i) {
                        final user = filteredUsers[i];
                        
                        return Button2Widget(
                          txt:
                              '${user.id_usuario} - @${user.usuario} - ${user.nome}',
                          onPressed: () {
                            context.goNamed(
                              'usuarioDetalhe',
                              pathParameters: {
                                'id': controller.allUsers[i].id_usuario.toString(),
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
