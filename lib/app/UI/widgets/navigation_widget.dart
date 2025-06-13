import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/pages/home_page.dart';
import 'package:ordem_de_servico/app/UI/pages/meu_perfil_page.dart';
import 'package:ordem_de_servico/app/src/helper/popup.dart';
import 'package:ordem_de_servico/colors.dart';


class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarWidget> {
  int _selectedIndex = 0;
  var colorsClass = ColorsClass();
  var popUpSair = PopUp();

  
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Perfil'),
        ],
        indicatorColor: colorsClass.terciaryColor,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          
        },
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomePage(),
          const MeuPerfilPage(),
        ],
      ),
    );
  }
}
