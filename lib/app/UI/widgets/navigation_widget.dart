import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarWidget> {
  
  @override
  Widget build(BuildContext context) {
    int atualIndex = 1;

    return NavigationBar(
      destinations: const <Widget>[
        NavigationDestination(icon: Icon(Icons.logout), label: 'Sair'),
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.people), label: 'Perfil'),
      ],
      indicatorColor: Colors.pinkAccent,
      selectedIndex: atualIndex,
      onDestinationSelected: (int index) {
        setState(() {
          atualIndex == index;
        });
        if (index==0){
          exit(0);
        }
        else if (index==1){
          context.go('/');
        }
        else if (index==2){
          GoRouter.of(context).push('/login');
        }
      },
    );
  }
}
