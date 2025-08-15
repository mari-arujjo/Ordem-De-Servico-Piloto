import 'package:flutter/material.dart';

class ListaUfWidget extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final dynamic txt;
  const ListaUfWidget({super.key, this.onChanged, required this.txt});

  @override
  State<ListaUfWidget> createState() => _DropdownState();
}

class _DropdownState extends State<ListaUfWidget> {
  String? ufSelecionada;
  final List<String> listUF = [
    "AC - Acre",
    "AL - Alagoas",
    "AP - Amapá",
    "AM - Amazonas",
    "BA - Bahia",
    "CE - Ceará",
    "DF - Distrito Federal",
    "ES - Espírito Santo",
    "GO - Goiás",
    "MA - Maranhão",
    "MT - Mato Grosso",
    "MS - Mato Grosso do Sul",
    "MG - Minas Gerais",
    "PA - Pará",
    "PB - Paraíba",
    "PR - Paraná",
    "PE - Pernambuco",
    "PI - Piauí",
    "RJ - Rio de Janeiro",
    "RN - Rio Grande do Norte",
    "RS - Rio Grande do Sul",
    "RO - Rondônia",
    "RR - Roraima",
    "SC - Santa Catarina",
    "SP - São Paulo",
    "SE - Sergipe",
    "TO - Tocantins",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Color(0xFF494949), offset: Offset(0, 1))],
      ),

      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: ufSelecionada,
            dropdownColor: Colors.white,
            isExpanded: true,
            hint: Text(widget.txt),

            items:
                listUF.map((String nivel) {
                  return DropdownMenuItem(value: nivel, child: Text(nivel));
                }).toList(),

            onChanged: (value) {
              setState(() {
                ufSelecionada = value;
              });
              if (widget.onChanged != null) {
                print('UF selecionada: $value');
                widget.onChanged!(value);
              }
            },
          ),
        ),
      ),
    );
  }
}
