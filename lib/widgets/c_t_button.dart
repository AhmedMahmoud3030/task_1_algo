import 'package:flutter/material.dart';

class CTButton extends StatelessWidget {
  final String btnText;
  final Color textColor;
  final Color iconBackground;
  final Color iconColor;
  final VoidCallback onPressed;
  final double iconSize;
  final IconData? iconData;

  const CTButton({
    super.key,
    required this.btnText,
    this.iconSize = 10,
    this.iconData,
    this.iconBackground = Colors.blueAccent,
    this.iconColor = Colors.white,
    this.textColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            btnText,
            style: TextStyle(color: textColor),
          ),
          SizedBox(
            width: 4,
          ),
          iconData != null
              ? CircleAvatar(
                  radius: iconSize,
                  backgroundColor: iconBackground,
                  child: Icon(
                    iconData,
                    color: iconColor,
                    size: iconSize,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
