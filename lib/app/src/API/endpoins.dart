import 'package:flutter/material.dart';
import 'package:ordem_de_servico/app/UI/widgets/botoes/bt_padrao_widget.dart';

class EndPointsPage extends StatefulWidget {
  const EndPointsPage({super.key});

  @override
  State<EndPointsPage> createState() => _EndPointsPageState();
}

class _EndPointsPageState extends State<EndPointsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste de EndPoints'),
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ButtonPadrao(
                txt: 'Obter todos os users', 
                onPressed: (){}, 
                tam: 200
              ),
              SizedBox(height: 20),
              ButtonPadrao(
                txt: 'Obter user por ID', 
                onPressed: (){}, 
                tam: 200
              ),
              SizedBox(height: 20),
              ButtonPadrao(
                txt: 'Criar user', 
                onPressed: (){}, 
                tam: 200
              ),
              SizedBox(height: 20),
              ButtonPadrao(
                txt: 'Alterar dados do user', 
                onPressed: (){}, 
                tam: 200
              ),
              SizedBox(height: 20),
              ButtonPadrao(
                txt: 'Excluir user', 
                onPressed: (){}, 
                tam: 200
              ),
            ],
          ),
        ),
      ),
    );
  }
}