import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PickImageWidget extends StatefulWidget {
  const PickImageWidget({super.key});

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  File? img;
  bool mudouFoto = false;
  final picker = ImagePicker();

  pickImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        img = File(pickedFile.path);
        mudouFoto = true;
      });
    }
  }
  pickImageCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        img = File(pickedFile.path);
        mudouFoto = true;
      });
    }
  }

  @override
Widget build(BuildContext context) {
  return AlertDialog(
    title: Text("Selecionar imagem"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        ElevatedButton.icon(
          icon: Icon(Icons.photo),
          label: Text("Galeria"),
          onPressed: pickImageGallery,
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.camera_alt),
          label: Text("Câmera"),
          onPressed: pickImageCamera,
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(null),
        child: Text("Cancelar"),
      ),
      if (img != null)
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(img); // Retorna a imagem
          },
          child: Text("Confirmar"),
        ),
    ],
  );
}

}