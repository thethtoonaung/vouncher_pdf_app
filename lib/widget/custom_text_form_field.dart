import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hinttext;
  final String? filltext;
  final String? requireText;
  final String? initialValue;
  final bool? readOnly;
  final bool? filled;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final IconButton? suffixiconn;
  final bool? obscureText;
  final int? maxLine;
  final int? maxLength;
  final void Function()? onTap;
  final Color? fillColor;
  final TextInputType? textInputType;
  final void Function(String)? onChange;

  const CustomTextFormField(
      {Key? key,
      this.hinttext,
      this.filltext,
      this.requireText,
      this.initialValue,
      this.readOnly,
      this.filled = true,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixiconn,
      this.maxLine,
      this.maxLength,
      this.onTap,
      this.obscureText,
      this.fillColor,
      this.textInputType,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType ?? TextInputType.text,
      onChanged: onChange,
      initialValue: initialValue,
      obscureText: obscureText ?? false,
      onTap: onTap ?? null,
      controller: controller,
      maxLines: maxLine ?? 1,
      maxLength: maxLength,
      readOnly: readOnly ?? false,
      // style: GoogleFonts.lato(
      //   textStyle: TextStyle(
      //       letterSpacing: .5, fontWeight: FontWeight.bold, fontSize: 13),
      // ),
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor ?? Color(0xfffdbdade),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 12,
        ),
        hintText: hinttext ?? "",
        // hintStyle: GoogleFonts.lato(
        //   textStyle: TextStyle(
        //       letterSpacing: .5, fontWeight: FontWeight.bold, fontSize: 13),
        // ),
        prefixIcon: prefixIcon ?? null,
        suffixIcon: suffixiconn ?? suffixIcon ?? null,
      ),
      validator: (value) {
        if (hinttext == "Flight Number" ||
            hinttext == 'Airline Name' ||
            hinttext == 'Hotel Name' ||
            hinttext == "Room Number" ||
            hinttext == "Remark" ||
            hinttext == "Driver Name" ||
            hinttext == 'User Name' ||
            hinttext == 'Business Unit' ||
            hinttext == 'Department') {
          return null;
        } else {
          if (value!.isEmpty) {
            return requireText ?? "This field is required.";
          }
          return null;
        }
      },
      // textInputAction: TextInputAction.done,
    );
  }
}
