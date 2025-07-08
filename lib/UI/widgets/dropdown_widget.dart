import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final List <String> listNivel;
  final String txt;
  final ValueChanged <String?>? onChanged;
  const DropdownWidget({
    super.key, 
    required this.listNivel, 
    required this.txt,
    this.onChanged,
  });

  @override
  State<DropdownWidget> createState() => _DropdownState();
}

class _DropdownState extends State<DropdownWidget> {
  String? nivelSelecionado;
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

            items: widget.listNivel.map((String nivel){
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