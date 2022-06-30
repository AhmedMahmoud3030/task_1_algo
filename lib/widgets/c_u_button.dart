import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CUButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double radius;
  final double? width;
  final Color borderColor;
  final Color buttonColor;
  final String buttonText;
  final Color buttonTextColor;
  final bool isIcon;
  final String? iconAsset;

  const CUButton({
    super.key,
    this.radius = 2,
    this.width,
    this.iconAsset,
    this.isIcon = false,
    required this.buttonText,
    this.buttonTextColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.buttonColor = Colors.blueAccent,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: buttonColor,
          textStyle: TextStyle(color: Colors.black),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.0, color: borderColor),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIcon ? SvgPicture.asset(iconAsset!, height: 30) : Container(),
            isIcon
                ? const SizedBox(
                    width: 20,
                  )
                : Container(),
            SizedBox(
              width: 4,
            ),
            Text(
              buttonText,
              style: TextStyle(color: buttonTextColor),
            )
          ],
        ),
      ),
    );
  }
}
