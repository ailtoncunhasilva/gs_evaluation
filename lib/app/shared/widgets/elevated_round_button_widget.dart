import 'package:flutter/material.dart';

class ElevatedRoundButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final double fontSize;
  final String labelText;
  final VoidCallback onPressed;

  ElevatedRoundButton({
    this.color,
    this.textColor,
    this.fontSize = 16,
    required this.labelText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color ?? Theme.of(context).primaryColor,
        minimumSize: Size.fromHeight(45),
      ),
      child: Text(
        labelText,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
