import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/app/UI/widgets/botoes/bt_padrao_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/inputs/ipt_outline_widget.dart';
import 'package:ordem_de_servico/app/UI/widgets/inputs/ipt_outline_senha_widget.dart';
import 'package:ordem_de_servico/app/assets/color/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  bool isChecked = false;
  bool obscurePassword = true;
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              SizedBox(height: 150),

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
                    border: Border.all(
                      color: colorsClass.primaryColor,
                      width: 0.7,
                    ),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        InputOutline(txt: "Usuário", ico: Icon(Icons.people)),

                        SizedBox(height: 20),

                        InputOutlineSenha(txt: "Senha"),

                        SizedBox(height: 20),
                        ButtonPadrao(txt: 'Entrar', onPressed: () {}, tam: 150),

                        SizedBox(height: 20),
                        ButtonPadrao(
                          txt: 'Entrar sem logar',
                          onPressed: () {
                            context.goNamed('Home');
                          },
                          tam: 150,
                        ),
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
