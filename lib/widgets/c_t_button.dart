import 'package:flutter/material.dart';

class CTButton extends StatelessWidget {
  final String btnText;
  final Color textColor;
  final VoidCallback onPressed;

  const CTButton({
    super.key,
    required this.btnText,
    this.textColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        btnText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
