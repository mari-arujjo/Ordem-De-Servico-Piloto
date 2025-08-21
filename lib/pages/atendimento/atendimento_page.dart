import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ordem_de_servico/widgets/botoes/bt_quadrado_widget.dart';

class AtendimentoPage extends StatefulWidget {
  const AtendimentoPage({super.key});

  @override
  State<AtendimentoPage> createState() => _AtendimentoState();
}

class _AtendimentoState extends State<AtendimentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Atendimento')),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: 20),
              Text(
                'Gerencie o cadastro de clientes\ne de parceiros',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonQuadrado(
                    txt: 'Fornecedores',
                    onPressed: () {
                      context.goNamed("gestaoFornecedores");
                    },
                    width: 160,
                    height: 160,
                    icon: Icons.business,
                  ),
                  SizedBox(width: 15),
                  ButtonQuadrado(
                    txt: 'Produtos',
                    onPressed: () {},
                    width: 160,
                    height: 160,
                    icon: Icons.inventory,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonQuadrado(
                    txt: 'Clientes',
                    onPressed: () {},
                    width: 160,
                    height: 160,
                    icon: Icons.group,
                  ),
                  SizedBox(width: 15),
                  ButtonQuadrado(
                    txt: 'Equipamentos',
                    onPressed: () {},
                    width: 160,
                    height: 160,
                    icon: Icons.devices_other,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonQuadrado(
                    txt: 'Técnicos',
                    onPressed: () {},
                    width: 160,
                    height: 160,
                    icon: Icons.engineering,
                  ),
                  SizedBox(width: 15),
                  ButtonQuadrado(
                    txt: 'Usuários',
                    onPressed: () {},
                    width: 160,
                    height: 160,
                    icon: Icons.people,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
