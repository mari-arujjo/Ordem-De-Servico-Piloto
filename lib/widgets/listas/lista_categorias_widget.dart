import 'package:flutter/material.dart';

class ListaCategoriasWidget extends StatefulWidget {
  final ValueChanged <String?>? onChanged;
  final dynamic txt;
  const ListaCategoriasWidget({
    super.key, 
    this.onChanged,
    required this.txt
  });

  @override
  State<ListaCategoriasWidget> createState() => _DropdownState();
}

class _DropdownState extends State<ListaCategoriasWidget> {
  String? categoriaSelecionada;
  final List<String> listCategorias = [
    "Ferramentas", "Eletrônicos", "Equipamentos", "Limpeza", "Geral"
  ];


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF494949),
            offset: Offset(0, 1)
          )
        ]
      ),

      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: categoriaSelecionada,
            dropdownColor: Colors.white,
            isExpanded: true,
            hint: Text(widget.txt),

            items: listCategorias.map((String nivel){
              return DropdownMenuItem(
                value: nivel,
                child: Text(nivel)
                );
              }).toList(),

            onChanged:(value) {
              setState(() {
                categoriaSelecionada = value;
              });
              if(widget.onChanged != null){
                print('Categoria selecionada: $value');
                widget.onChanged!(value);
              }
            },

          ),
        ),
      )
    );
  }
}