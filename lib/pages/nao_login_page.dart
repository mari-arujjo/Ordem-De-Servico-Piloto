import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_pro/widgets/botoes/bt_icon_txt_widget.dart';

class NaoLogadoPage extends StatelessWidget {
  const NaoLogadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),

            Text('Você ainda não está logado.', style: TextStyle(fontSize: 18)),

            Image.asset(
              "lib/assets/imgs/robo_quebrado.jpg",
              height: 350,
              width: 350,
            ),

            SizedBox(height: 30),
            ButtonComIconTexto(
              txt: 'Fazer login',
              onPressed: () {
                context.push(context.namedLocation("Login"));
              },
              tam: 190,
              ico: Icon(Icons.login, color: Colors.white),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
