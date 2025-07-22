import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/botoes/bt_lista_widget.dart';
import 'package:ordem_de_servico/UI/widgets/visualiza%C3%A7%C3%A3o/carregando_widget.dart';
import 'package:ordem_de_servico/src/entidades/usuario/u_store.dart';
import 'package:provider/provider.dart';

class EndPointsPage extends StatefulWidget {
  const EndPointsPage({super.key});

  @override
  State<EndPointsPage> createState() => _EndPointsPageState();
}

class _EndPointsPageState extends State<EndPointsPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask((){
      final store = context.read<UsuarioStore>();
      store.getUsuarios();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<UsuarioStore>();

    return Scaffold(
      appBar: AppBar(title: const Text('Teste de EndPoints')),

      body: Builder(
        builder: (context) {
          if (store.isLoading) {
            return const Center(child: CarregandoWidget());
          }

          if (store.erro.isNotEmpty) {
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

          if (store.usuario.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Nenhum registro encontrado.',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.all(20),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: store.usuario.length,
              itemBuilder: (_, index) {
                final user = store.usuario[index];
                return ButtonLista(
                  txt: '${user.id_usuario} - @${user.usuario} - ${user.nome}',
                  onPressed: (){}
                );
                
              },
            );
          }
        },
      ),
    );
  }
}
