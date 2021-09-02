import 'package:flutter/material.dart';
import 'package:gs_two/app/core/const.dart';

class CardGenderDialogWidget extends StatelessWidget {
  final Widget textWidget;
  final Widget dropWidget;
  final Widget buttonWidget;

  CardGenderDialogWidget({required this.textWidget, required this.dropWidget, required this.buttonWidget});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(.16),
      child: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: Column(
          children: [
            textWidget,
            dropWidget,
            buttonWidget,
          ],
        ),
      ),
    );
  }
}
