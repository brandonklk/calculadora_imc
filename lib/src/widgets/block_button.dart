import 'package:flutter/material.dart';
import 'package:calculator_imc/src/enums/button_enum.dart';
import 'package:calculator_imc/src/constants/styles.dart';

class BlockButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final TypeButton typeButton;
  final Function()? onPressed;

  const BlockButton(
      {Key? key,
      this.icon,
      required this.label,
      this.onPressed,
      required this.typeButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthButton = MediaQuery.of(context).size.width;

    switch (typeButton) {
      case TypeButton.buttonIcon:
        return SizedBox(
          width: widthButton,
          child: ElevatedButton.icon(
            onPressed: onPressed,
            style: buttonBlockStyle,
            icon: Icon(icon, size: 28.0),
            label: Text(label, style: textButton),
          ),
        );
      default:
        return SizedBox(
          width: widthButton,
          child: ElevatedButton(
            onPressed: onPressed,
            style: buttonBlockStyle,
            child: Text(label, style: textButton),
          ),
        );
    }
  }
}
