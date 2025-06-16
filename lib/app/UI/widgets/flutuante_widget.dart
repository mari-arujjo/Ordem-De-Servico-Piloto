import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/colors.dart';

class FlutuanteWidget extends StatefulWidget {
  const FlutuanteWidget({super.key});

  @override
  State<FlutuanteWidget> createState() => _FlutuanteState();
}

class _FlutuanteState extends State<FlutuanteWidget> {
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: colorsClass.terciaryColor,
      onPressed: (){
        context.goNamed('cadastroUsuario');
      },
      child: Icon(Icons.add),
      
    );
     
  }
}