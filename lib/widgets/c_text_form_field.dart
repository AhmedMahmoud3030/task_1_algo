// import 'package:flutter/material.dart';

// class CTextFormField extends StatelessWidget {
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//   final String? Function(String?)? validator;
//   final String hintText;
//   final double radius;
//   final bool isPassword;

//   const CTextFormField({
//     super.key,
//     required this.inputType,
//     this.inputAction = TextInputAction.next,
//     this.isPassword = false,
//     this.validator,
//     required this.hintText,
//     this.radius = 8,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       child: TextFormField(
//         obscureText: isPassword,
//         keyboardType: TextInputType.text,
//         decoration: InputDecoration(
//           suffixIcon: Icon(Icons.visibility ),
//           contentPadding: EdgeInsets.all(12),
//           hintText: hintText,
//
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  final TextEditingController controller;

  final TextInputType type;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final double width;

  final void Function()? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final String label;
  final IconData? suffix;
  final void Function()? suffixPressed;
  final bool isClickable;
  final bool isMergedToAnotherBox;
  final Color borderColor;
  final Widget? prefix;

  const CTextFormField({
    super.key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.width = 200,
    this.prefix,
    this.isPassword = false,
    this.isMergedToAnotherBox = false,
    this.borderColor = Colors.blueGrey,
    this.isClickable = true,
    this.onTap,
    this.validate,
    required this.label,
    this.suffix,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        cursorColor: const Color(0xFF9FD3D0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          border: const OutlineInputBorder(borderSide: BorderSide()),
          hintText: label,
          prefixIcon: prefix,
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
