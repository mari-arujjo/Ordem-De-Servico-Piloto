import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/flutuante_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestão de usuários'),
      ),

      floatingActionButton: FlutuanteWidget(),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: Column(
            children: [
              const SearchBarWidget(),

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 8, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: colorsClass.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: colorsClass.secondaryColor,
                        blurRadius: 0,
                        offset: Offset(0, 2),
                      )
                    ]
                ),

                  child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemCount: controller.allUsers.length,
                    separatorBuilder: (_, __) => SizedBox(height:12),
                    itemBuilder: (BuildContext context, int i){
                      final allUsers = controller.allUsers;

                      return Container(
                        padding: EdgeInsets.only(left:15,top: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              offset: Offset(0, 4),
                            )
                          ]
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.goNamed("usuario");
                                },
                              child: Text('${allUsers[i].id_usuario} - @${allUsers[i].usuario} - ${allUsers[i].nome}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize:16),
                                ),
                              ),
                            ),

                            Icon(Icons.edit)
                          ],
                        ),
                      );
                    }, 
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}