import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String txt;
  final Color primaryColor;
  final Color secondaryColor;
  final Color terciaryColor;
  final VoidCallback onPressed;

  const ButtonWidget({
    super.key,
    required this.txt, 
    required this.onPressed,
    this.primaryColor = const Color(0xFF2C2C2C), 
    this.secondaryColor = const Color(0xFF616060),
    this.terciaryColor = Colors.pinkAccent
    });

  @override
    State<ButtonWidget> createState()=> _ButtonWidgetState();
}


class _ButtonWidgetState extends State<ButtonWidget>{
  bool pressionado = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,

      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if(states.contains(WidgetState.pressed)){
                return widget.terciaryColor;
              }
              return widget.primaryColor;
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
        
        child: Text(
          widget.txt,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 15,
          ),
        ),
      ), 
    );
  }
}