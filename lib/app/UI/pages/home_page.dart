import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vindo!',
        style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      /*endDrawer: SafeArea(
        child: Drawer(
          width: 220,
          child: Column(
            children: [
              ListTile(
                title: Text("Home", 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                leading: Icon(Icons.home),
              ),
              Divider(),
              ListTile(
                title: Text("Login"),
                leading: Icon(Icons.login),
              ),
              ListTile(
                title: Text("Meu perfil"),
                leading: Icon(Icons.people),
              ), 
              ListTile(
                title: Text("Sair"),
                leading: Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
      */

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

              ButtonWidget(txt: 'Atendimento'),
              SizedBox(height: 20),

              ButtonWidget(txt: 'Manutenção'),
              SizedBox(height: 20),

              ButtonWidget(txt: 'Ordem de serviço'),
              SizedBox(height: 20),

              ButtonWidget(txt: 'Gestão de usuários'),
            ],
          ),
        ),
      ),
    );
  }
}