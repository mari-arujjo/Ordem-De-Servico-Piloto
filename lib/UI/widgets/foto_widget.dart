import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ordem_de_servico/assets/color/colors.dart';

class FotoDePerfilWidget extends StatefulWidget {
  final File? imgFile;

  const FotoDePerfilWidget({super.key, this.imgFile});

  @override
  State<FotoDePerfilWidget> createState() => _FotoDePerfilWidgetState();
}

class _FotoDePerfilWidgetState extends State<FotoDePerfilWidget> {
  var cor = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 65,
      backgroundColor: cor.terciaryColor,
      backgroundImage: widget.imgFile != null ? FileImage(widget.imgFile!) : null,
      child: widget.imgFile == null
          ? Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            )
          : null,
    );
  }
}
