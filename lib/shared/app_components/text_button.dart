import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final Function() function;
  final String text;
  final Color? color;
  final double fontSize;

  final FontWeight fontWeight;

  const DefaultTextButton({
    Key? key,
    required this.function,
    required this.text,
    this.color,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
              color: color, fontSize: fontSize, fontWeight: fontWeight),
        ));
  }
}
