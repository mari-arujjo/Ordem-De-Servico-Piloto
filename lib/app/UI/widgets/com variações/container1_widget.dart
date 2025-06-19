import 'package:flutter/material.dart';
import 'package:ordem_de_servico/colors.dart';

class Container1Widget extends StatefulWidget {
  final Widget child;
  const Container1Widget({super.key, required this.child});

  @override
  State<Container1Widget> createState() => _Container1WidgetState();
}

class _Container1WidgetState extends State<Container1Widget> {
  var colorsClass = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorsClass.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.child,
    );
  }
}
