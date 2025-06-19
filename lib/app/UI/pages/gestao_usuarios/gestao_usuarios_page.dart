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
      appBar: AppBar(title: const Text('Gestão de usuários')),

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
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 8,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: colorsClass.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: colorsClass.secondaryColor,
                        blurRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.separated(
                      padding: EdgeInsets.all(16),
                      itemCount: controller.allUsers.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12),
                      itemBuilder: (BuildContext context, int i) {
                        final allUsers = controller.allUsers;

                        return SizedBox(
                          height: 50,
                          width: 100,

                          child: ElevatedButton(
                            onPressed: () {
                              context.goNamed("usuario");
                            },
                            style: ButtonStyle(
                              elevation: const WidgetStatePropertyAll(3),
                              shadowColor: const WidgetStatePropertyAll(
                                Colors.black,
                              ),
                              backgroundColor:
                                  WidgetStateProperty.resolveWith<Color>((
                                    states,
                                  ) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return colorsClass.terciaryColor;
                                    }
                                    return Colors.white;
                                  }),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${allUsers[i].id_usuario} - @${allUsers[i].usuario} - ${allUsers[i].nome}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: colorsClass.primaryColor,
                                    ),
                                  ),
                                ),

                                Icon(
                                  Icons.edit,
                                  color: colorsClass.primaryColor,
                                ),
                              ],
                            ),
                          ),
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
