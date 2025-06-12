import 'package:flutter/material.dart';

class IconsWidget extends StatefulWidget {
  final Icon ico;
  final Color primaryColor;
  final Color secondaryColor;
  final Color terciaryColor;
  final VoidCallback onPressed;

  const IconsWidget({
    super.key,
    required this.ico, 
    required this.onPressed,
    this.primaryColor = const Color(0xFF2C2C2C), 
    this.secondaryColor = const Color(0xFF616060),
    this.terciaryColor = Colors.pinkAccent
    });

  @override
    State<IconsWidget> createState()=> _IconsState();
}


class _IconsState extends State<IconsWidget>{
  bool pressionado = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,

      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if(states.contains(WidgetState.pressed)){
                return widget.terciaryColor;
              }
              return Color(0xffffffff);
            },
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
          ),
          padding: WidgetStateProperty.all(EdgeInsets.zero)
        ),
        
        child: widget.ico
      ),
    );
  }
}