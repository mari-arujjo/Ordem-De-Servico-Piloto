import 'package:flutter/material.dart';
import 'package:ordem_pro/widgets/inputs/ipt_padrao_widget.dart';
import 'package:ordem_pro/widgets/visualizacao/container_padrao_widget.dart';

class CadastroUserPage extends StatefulWidget {
  const CadastroUserPage({super.key});

  @override
  State<CadastroUserPage> createState() => _CadastroUserPageState();
}

class _CadastroUserPageState extends State<CadastroUserPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de usuário')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 20),
          child: Column(
            children: [
              ContainerPadrao(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// RAZÃO SOCIAL
                      Text('Nome:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadrao(controller: nomeController, maxLength: 50),

                      /// USERNAME
                      Text('Usuário:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadrao(controller: nomeController, maxLength: 20),

                      /// EMAIL
                      Text('Email:', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      InputPadrao(controller: emailController, maxLength: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
