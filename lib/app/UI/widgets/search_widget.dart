import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: const BoxConstraints(
        minWidth: 300,  // Largura mínima
        maxWidth: 350,  // Largura máxima
        minHeight: 48,  // Altura mínima
        maxHeight: 56,  // Altura máxima
      ),
      leading: const Icon(Icons.search),
      hintText: 'Pesquisar',
    );
  }
}