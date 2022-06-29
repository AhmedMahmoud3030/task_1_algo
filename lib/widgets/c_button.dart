import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  final double radius;
  final double width;
  final Color textColor;
  final Color btnColor;

  const CButton({
    super.key,
    required this.onPressed,
    required this.btnText,
    this.radius = 2,
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.btnColor = Colors.blueAccent,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            foregroundColor: MaterialStateProperty.all<Color>(textColor),
            backgroundColor: MaterialStateProperty.all<Color>(btnColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                    side: BorderSide(color: btnColor)))),
        onPressed: onPressed,
        child: Text(btnText),
      ),
    );
  }
}
