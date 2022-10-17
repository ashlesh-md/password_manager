import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String route;
  final String text;
  final bool colour;
  final double buttonHeight;
  final double buttonWidth;
  final bool fontColor;
  final double elevation;
  final bool callback;
  const Button(
      {Key? key,
      required this.route,
      required this.text,
      this.colour = true,
      this.fontColor = true,
      this.buttonHeight = 350,
      this.buttonWidth = 50,
      this.elevation = 1,
      this.callback = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: TextButton.styleFrom(
            elevation: elevation,
            minimumSize: Size(buttonHeight, buttonWidth),
            backgroundColor:
                colour ? Colors.indigo.shade300 : Colors.grey.shade100),
        onPressed: (() {
          if (!callback) {
            Navigator.pushNamed(context, route);
          }
        }),
        child: Text(text,
            style: TextStyle(
                color: fontColor ? Colors.indigo.shade300 : Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal)));
  }
}
