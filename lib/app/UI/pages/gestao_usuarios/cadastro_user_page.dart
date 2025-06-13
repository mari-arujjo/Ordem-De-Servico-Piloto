import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';
import 'package:ordem_de_servico/colors.dart';


class CadastroUserPage extends StatefulWidget {
  const CadastroUserPage({super.key});

  @override
  State<CadastroUserPage> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUserPage> {
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuários')
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                    color: colorsClass.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                )
              ),

              ButtonWidget(txt: 'Salvar dados', onPressed: (){})
            ],
          ),
        ),
      ),

    );
  }
}