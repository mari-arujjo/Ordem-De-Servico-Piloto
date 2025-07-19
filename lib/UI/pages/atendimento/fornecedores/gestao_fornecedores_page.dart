import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/search_widget.dart';

class GestaoFornecedoresPage extends StatefulWidget {
  const GestaoFornecedoresPage({super.key});

  @override
  State<GestaoFornecedoresPage> createState() => _GestaoFornecedoresPageState();
}

class _GestaoFornecedoresPageState extends State<GestaoFornecedoresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de fornecedores'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchBarWidget(onSearch: (p0) {}),
        ),
      ),
    );
  }
}
