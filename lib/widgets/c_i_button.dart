// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CIButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  final double width;
  final double height;
  final Color btnColor;
  final Color txtColor;

  const CIButton({
    super.key,
    this.width = double.infinity,
    this.height = 40,
    required this.onPressed,
    this.btnColor = Colors.transparent,
    this.txtColor = Colors.blueGrey,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
            color: txtColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2)),
      width: width,
      child: RaisedButton(
        color: btnColor,
        elevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/google.svg', height: 30),
            const SizedBox(
              width: 20,
            ),
            Text(
              btnText,
              style: TextStyle(color: txtColor),
            ),
          ],
        ),
      ),
    );
  }
}
