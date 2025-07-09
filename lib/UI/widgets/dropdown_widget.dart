import 'package:flutter/material.dart';

class ListaNiveisWidget extends StatefulWidget {
  final ValueChanged <String?>? onChanged;
  final dynamic txt;
  const ListaNiveisWidget({
    super.key, 
    this.onChanged,
    required this.txt
  });

  @override
  State<ListaNiveisWidget> createState() => _DropdownState();
}

class _DropdownState extends State<ListaNiveisWidget> {
  String? nivelSelecionado;
  final List<String> listNivel = [
    "1 - Administrador",
    "2 - Moderador",
    "3 - Padrão",
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
            value: nivelSelecionado,
            dropdownColor: Colors.white,
            isExpanded: true,
            hint: Text(widget.txt),

            items: listNivel.map((String nivel){
              return DropdownMenuItem(
                value: nivel,
                child: Text(nivel)
                );
              }).toList(),

            onChanged:(value) {
              setState(() {
                nivelSelecionado = value;
              });
              if(widget.onChanged != null){
                print('Nível selecionado: $value');
                widget.onChanged!(value);
              }
            },

          ),
        ),
      )
    );
  }
}