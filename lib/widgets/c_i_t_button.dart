// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CITButton extends StatelessWidget {
  final String btnText;
  final Color textColor;
  final Color btnColor;
  final VoidCallback onPressed;
  final IconData iconData;
  final double iconSize;

  const CITButton({
    super.key,
    required this.btnText,
    this.textColor = Colors.black,
    this.btnColor = Colors.transparent,
    this.iconSize = 10,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: btnColor,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      elevation: 0,
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            btnText,
            style: TextStyle(color: textColor),
          ),
          const SizedBox(
            width: 6,
          ),
          CircleAvatar(
            radius: iconSize,
            backgroundColor: Colors.blueAccent,
            child: Icon(
              iconData,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
