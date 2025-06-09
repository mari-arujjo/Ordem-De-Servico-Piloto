import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomeState();
}

  class _HomeState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Bem vindo!',
          style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),

        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.logout), label: 'Sair'),
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.people), label: 'Perfil'),
          ],
          selectedIndex: 1,
        ),


        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Image.asset('lib/app/assets/imgs/tudo_em_ordem.png', width: 230, height: 230),
                SizedBox(height: 20),

                ButtonWidget(
                  txt: 'Atendimento',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/atendimento');
                  },
                ),
                SizedBox(height: 20),

                ButtonWidget(
                  txt: 'Manutenção',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/manutencao');
                  },
                  ),
                SizedBox(height: 20),

                ButtonWidget(
                  txt: 'Ordem de serviço',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/ordemOs');
                  },
                  ),
                SizedBox(height: 20),

                ButtonWidget(
                  txt: 'Gestão de usuários',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/gestaoUsuarios');
                  },
                  ),
              ],
            ),
          ),
        ),
      );
    }
  }