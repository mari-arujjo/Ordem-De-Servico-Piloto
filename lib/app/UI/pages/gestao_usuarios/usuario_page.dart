import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/input1_widget.dart';
import 'package:ordem_de_servico/colors.dart';

class UsuarioPage extends StatefulWidget {

  const UsuarioPage({
    super.key,
  });

  @override
  State<UsuarioPage> createState() => _UsuarioState();
}

class _UsuarioState extends State<UsuarioPage> {
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('@mari')
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                width: 120, 
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: colorsClass.gray,
                      blurRadius: 10,
                      offset: Offset(0, 5)
                    )
                  ]
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'lib/app/assets/imgs/eu.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text('ID: 1'),

              SizedBox(height: 20),
              
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorsClass.secondaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Form(
                  child: Column(
                    children: [

                      /// NOME
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nome:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Input1Widget(obscure: false),
                      SizedBox(height: 20),

                      /// USUARIO
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Usuário:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Input1Widget(obscure: false),
                      SizedBox(height: 20),

                      /// NIVEL
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nivel de acesso:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Input1Widget(obscure: false),
                    ],
                  )
                ),
              ),

              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Mudar senha',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),


              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorsClass.secondaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Form(
                  child: Column(
                    children: [

                      /// NOME
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nova senha:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Input1Widget(obscure: true),
                      SizedBox(height: 20),

                      /// USUARIO
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Confirmar nova senha:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Input1Widget(obscure: true),

                    ],
                  )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}