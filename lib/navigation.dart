import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/popup.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:provider/provider.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<NavigationBarWidget> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarWidget> {
  int _selectedIndex = 0;
  var popUpSair = PopUp();

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 2, color: Colors.white),
          NavigationBar(
            backgroundColor: cor.secundaria,
            indicatorColor: cor.terciaria,
            selectedIndex: _selectedIndex,
            destinations: const <Widget>[
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.people), label: 'Perfil'),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
              _goToBranch(_selectedIndex);
            },
          ),
        ],
      ),

      body: SizedBox(child: widget.navigationShell),
    );
  }
}
