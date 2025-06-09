import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/data/controllers/navigation_controller.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarWidget> {
  final NavigationController controller = NavigationController();
  int atualIndex = 1;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const <Widget>[
        NavigationDestination(icon: Icon(Icons.logout), label: 'Sair'),
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.people), label: 'Perfil'),
      ],
      indicatorColor: Colors.pinkAccent,
      selectedIndex: atualIndex,
      onDestinationSelected: (int index) {
        controller.navegacao(context, atualIndex, index);
        setState(() {
          atualIndex=index;
        });
      },
    );
  }
}
