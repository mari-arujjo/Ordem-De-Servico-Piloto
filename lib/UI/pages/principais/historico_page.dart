import 'package:flutter/material.dart';
import 'package:ordem_de_servico/UI/widgets/container_padrao_widget.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class HistoricoPage extends StatefulWidget {
  final int idUsuario;
  const HistoricoPage({super.key, required this.idUsuario});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  var cor = ColorsClass();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de ações')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ContainerPadrao(
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: false,
            
            child: SingleChildScrollView(
              child: DataTable(
                border: TableBorder.all(color: cor.primaryColor, width: 1),
                //decoration: BoxDecoration(color: cor.secondaryColor),
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Usuário')),
                  DataColumn(label: Text('Data')),
                  DataColumn(label: Text('Ação')),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),

                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),

                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),

                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),

                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
