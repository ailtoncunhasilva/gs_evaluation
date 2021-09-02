import 'package:flutter/material.dart';
import 'package:gs_two/app/core/const.dart';

class TextStyleDetailWidget extends StatelessWidget {
  final String listedText;
  final String text;
  final Color? color;
  final FontWeight? fontWeight;

  TextStyleDetailWidget({
    required this.listedText,
    required this.text,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: kSpacing, left: kSpacing),
          child: Text(listedText),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kSpacing),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ],
    );
  }
}
