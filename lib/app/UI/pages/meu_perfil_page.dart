import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';

class MeuPerfilPage extends StatefulWidget {
  const MeuPerfilPage({super.key});

  @override
  State<MeuPerfilPage> createState() => _MeuPerfilState();
}


class _MeuPerfilState extends State<MeuPerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil')
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              ButtonWidget(
                txt: 'Fazer login!', 
                onPressed: (){
                  GoRouter.of(context).push('/login');
                }),
            ],
          ),
        ),
      ),
    );
  }
}