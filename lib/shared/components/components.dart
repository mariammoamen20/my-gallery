import 'package:flutter/material.dart';

Widget defaultText({
  required String text,
  required double size,
  required FontWeight fontWeight,
  int? maxLines,
  double? height,
  Color? color,
  TextOverflow? textOverflow,
}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: textOverflow,
    style: TextStyle(
      height: height,
      fontSize: size,
      fontWeight: fontWeight,
      color: color,

    ),
  );
}

Widget defaultTextFormFiled({
  required TextEditingController controller,
  required String text,
  required String hintText,
  Widget? suffixIcon,
  void Function()? suffixPressed,
  bool isPassword = false,
}) {
  return TextFormField(
    obscureText: isPassword,
    validator: (value) {
      if (value!.isEmpty) {
        return text;
      }
      return null;
    },
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: suffixIcon != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: suffixIcon,
            )
          : null,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      filled: true,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.black45,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          50.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          50.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          50.0,
        ),
      ),
    ),
  );
}
