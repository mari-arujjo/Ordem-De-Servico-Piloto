import 'package:flutter/material.dart';
import 'package:ordem_de_servico/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/widgets/inputs/ipt_outline_widget.dart';
import 'package:ordem_de_servico/widgets/inputs/ipt_senha_outline_widget.dart';
import 'package:ordem_de_servico/assets/color/cores.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  bool isChecked = false;
  bool obscurePassword = true;
  late TextEditingController usuarioController;
  late TextEditingController senhaController;

  @override
  void initState() {
    super.initState();
    usuarioController = TextEditingController();
    senhaController = TextEditingController();
  }

  @override
  void dispose(){
    super.dispose();
    usuarioController = TextEditingController();
    senhaController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              SizedBox(height: 100),

              Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 5),
              Text('Bem vindo de volta!', style: TextStyle(fontSize: 18)),

              SizedBox(height: 40),

              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: cor.primaria, width: 0.7),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        InputOutline(txt: "Usuário", ico: Icon(Icons.people),controller: usuarioController,),

                        SizedBox(height: 20),

                        InputOutlineSenha(txt: "Senha",controller: senhaController,),

                        SizedBox(height: 20),
                        ButtonPadrao(txt: 'Entrar', onPressed: () {}, tam: 150),
                      ],
                    ),
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
