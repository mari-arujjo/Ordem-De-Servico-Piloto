import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/colors.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/icons_widget.dart';
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
        title: const Text('Gestão de usuários',
        style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: Column(
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 10,),

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: colorsClass.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 0.5,
                        offset: Offset(0, 2),
                      )
                    ]
                ),

                  child: ListView.separated(
                    itemCount: controller.allUsers.length,
                    itemBuilder: (BuildContext context, int i){
                      final allUsers = controller.allUsers;
                      return ListTile(
                        tileColor: Colors.white,
                        title: Text('${allUsers[i].id_usuario} - ${allUsers[i].usuario} - ${allUsers[i].nome}'),
                        trailing: IconsWidget(
                          ico: Icon(Icons.edit, color: Colors.black), 
                          onPressed: () {
                            GoRouter.of(context).push('/usuario');
                          }),
                        onTap: () {
                          
                        },
                      );
                    },
                    separatorBuilder: (_, __) => Divider(), 
                    padding: EdgeInsets.all(16),
                  ),
                ),
              ),

              ButtonWidget(
                txt: 'Novo', 
                onPressed: (){
                  GoRouter.of(context).push('/cadastroUsuario');
                }),
            ]
          ),
        ),
      ),
    );
  }
}