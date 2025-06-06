import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState()=> _LoginPageState();
}

  class _LoginPageState extends State<LoginPage> {
    @override
      Widget build(BuildContext context){
      return Scaffold(

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Image.asset('lib/app/assets/imgs/tudo_em_ordem.png', width: 200, height: 200),
                SizedBox(height: 20),
                
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Usuário",
                            prefixIcon: Icon(Icons.people),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 20),

                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 10),
                        Row(
                          children: [

                          ],
                        ),

                        SizedBox(height: 20),
                        ButtonWidget(txt: 'Entrar'),

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

