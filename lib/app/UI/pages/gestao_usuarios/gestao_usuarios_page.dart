import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/search_widget.dart';
import 'package:ordem_de_servico/app/src/controllers/gestao_usuarios_controller.dart';

class GestaoUsuariosPage extends StatefulWidget {
  const GestaoUsuariosPage({super.key});

  @override
  State<GestaoUsuariosPage> createState() => _GestaoUsuariosState();
}

class _GestaoUsuariosState extends State<GestaoUsuariosPage> {
  var controller = GestaoUsuariosController();

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
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Column(
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 10,),

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 30, right: 20, left: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFEDEDED),
                    borderRadius: BorderRadius.circular(10.0),
                ),
                  child: ListView.separated(
                    itemCount: controller.allUsers.length,
                    itemBuilder: (BuildContext context, int i){
                      final allUsers = controller.allUsers;
                      return ListTile(
                        leading: Icon(Icons.people),
                        title: Text(allUsers[i].nome),
                        trailing: Text(allUsers[i].usuario),
                        onTap: () {
                          GoRouter.of(context).push('/usuarios');
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