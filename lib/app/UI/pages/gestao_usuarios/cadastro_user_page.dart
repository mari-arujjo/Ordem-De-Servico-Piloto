import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/button_widget.dart';
import 'package:ordem_de_servico/app/src/helper/popup.dart';
import 'package:ordem_de_servico/colors.dart';


class CadastroUserPage extends StatefulWidget {
  const CadastroUserPage({super.key});

  @override
  State<CadastroUserPage> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUserPage> {
    bool isChecked = false;
    bool obscurePassword = true;
    bool isChecked2 = false;
    bool obscurePassword2 = true;
    var colorsClass = ColorsClass();
    var popUp = PopUp();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de usuários')
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colorsClass.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    child: Form(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nome:', 
                              style: TextStyle(fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white
                            ),
                          ),
                          SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Usuário:', 
                              style: TextStyle(fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white
                            ),
                          ),
                          SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nível de acesso:', 
                              style: TextStyle(fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white
                            ),
                          ),
                          SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nível de acesso:', 
                              style: TextStyle(fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white
                            ),
                          ),
                          SizedBox(height: 20),


                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Senha:', 
                              style: TextStyle(fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  obscureText: obscurePassword,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white
                                  ),
                                ),

                              ),
                              Checkbox(
                                activeColor: colorsClass.terciaryColor,
                                value: isChecked, 
                                onChanged: (bool? value){
                                  setState(() {
                                    isChecked = value!;
                                    obscurePassword = !isChecked;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Confirmar senha:', 
                              style: TextStyle(fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  obscureText: obscurePassword2,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white
                                  ),
                                ),

                              ),
                              Checkbox(
                                activeColor: colorsClass.terciaryColor,
                                value: isChecked2, 
                                onChanged: (bool? value){
                                  setState(() {
                                    isChecked2 = value!;
                                    obscurePassword2 = !isChecked2;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                  )
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(txt: 'Salvar dados', onPressed: (){}, tam: 150),
                    SizedBox(width: 20),
                    ButtonWidget(txt: 'Cancelar', onPressed: (){
                      popUp.PopUpCancel(context);
                    }, 
                    tam: 150)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}