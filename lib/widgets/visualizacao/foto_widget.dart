import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ordem_pro/cores.dart';
import 'package:provider/provider.dart';

class FotoDePerfilWidget extends StatefulWidget {
  final File? imgFile;
  final double tam;
  final Uint8List? imgBytes;

  const FotoDePerfilWidget({
    super.key,
    this.imgFile,
    this.imgBytes,
    required String img,
    required this.tam,
  });

  @override
  State<FotoDePerfilWidget> createState() => _FotoDePerfilWidgetState();
}

class _FotoDePerfilWidgetState extends State<FotoDePerfilWidget> {
  @override
  Widget build(BuildContext context) {
    final cor = Provider.of<CoresClass>(context);
    ImageProvider? imagem;
    if (widget.imgFile != null) {
      imagem = FileImage(widget.imgFile!);
    } else if (widget.imgBytes != null) {
      imagem = MemoryImage(widget.imgBytes!);
    }

    return CircleAvatar(
      radius: widget.tam,
      backgroundColor: cor.terciaria,
      backgroundImage: imagem,
      child:
          imagem == null
              ? Icon(Icons.person, size: 40, color: Colors.white)
              : null,
    );
  }
}
