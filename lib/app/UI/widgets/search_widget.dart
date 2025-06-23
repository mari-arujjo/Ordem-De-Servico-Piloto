import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearch;
  const SearchBarWidget({super.key, required this.onSearch});

  @override
  State<SearchBarWidget> createState() => _SearchBarState();
}


class _SearchBarState extends State<SearchBarWidget> {
  var colorsClass = ColorsClass();
  final TextEditingController controller = TextEditingController();
  void _onTextChanged(String text){
    widget.onSearch(text);
  }


  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      onChanged: _onTextChanged,
      constraints: const BoxConstraints(
        minWidth: 200,  // Largura mínima
        maxWidth: 300,  // Largura máxima
        minHeight: 48,  // Altura mínima
        maxHeight: 56,  // Altura máxima
      ),
      backgroundColor: WidgetStatePropertyAll(colorsClass.secondaryColor),
      leading: const Icon(Icons.search),
      hintText: 'Pesquisar',
      elevation: const WidgetStatePropertyAll(1),
    );
  }
}