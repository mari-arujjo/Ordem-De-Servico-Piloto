import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/src/usuario/u_store.dart';
import 'package:ordem_de_servico/app/src/API/http_client.dart';
import 'package:ordem_de_servico/app/src/usuario/u_repository.dart';

class EndPointsPage extends StatefulWidget {
  const EndPointsPage({super.key});

  @override
  State<EndPointsPage> createState() => _EndPointsPageState();
}

class _EndPointsPageState extends State<EndPointsPage> {
  final UsuarioStore controller = UsuarioStore(
    repositorio: UsuarioRepository(
      client: HttpClient()
    ),
  );

  @override
  void initState(){
    super.initState();
    controller.getUsuarios();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teste de EndPoints')),

      body: AnimatedBuilder(
        animation: Listenable.merge([
          controller.isLoading,
          controller.erro,
          controller.state,
        ]), 

        builder:(context, child) {
          if(controller.isLoading.value){
            return const CircularProgressIndicator();
          }

          if(controller.erro.value.isNotEmpty){
            return Center(
              child: Text(
                controller.erro.value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ),
            );
          }

          if(controller.state.value.isEmpty){
            return Center(
              child: Text(
                'nenhum item na lista',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder:(context, index) => const SizedBox(height: 20), 
              padding: EdgeInsets.all(20),
              itemCount: controller.state.value.length,
              itemBuilder:(_, index) {
                final user = controller.state.value[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(user.usuario),
                      subtitle: Column(
                        children: [
                          Text(user.nome),
                          Text('ID: ${user.id_usuario}'), // Agora usando como int
                          Text('Nível: ${user.nivel_acesso}'),
                        ],
                      ),
                    )
                  ],

                );
                
              },
            );
          }
        }
      ),
    );
  }
}
