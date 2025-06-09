import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState()=> _LoginState();
}

  class _LoginState extends State<LoginPage> {
    bool isChecked = false;
    bool obscurePassword = true;
    @override
      Widget build(BuildContext context){
      return Scaffold(

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 170),
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
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked, 
                              onChanged: (bool? value){
                                setState(() {
                                  isChecked = value!;
                                  obscurePassword = !isChecked;
                                });
                              },
                            ),
                            const Text('Mostrar senha'),
                          ],
                        ),

                        SizedBox(height: 20),
                        ButtonWidget(
                          txt: 'Entrar',
                          onPressed: () {
                            Navigator.of(context).pushNamed('/');
                            },
                        ),

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

