import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.suffix,
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.obscureText = false,
    this.suffixIcon,
  });
  final Widget? suffix;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Field required';
        return null;
      },

      keyboardType: keyboardType,
      cursorColor: Colors.black,
      cursorHeight: 20,
      cursorWidth: 1,
      cursorRadius: const Radius.circular(10),
      style: const TextStyle(color: Colors.black),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixIconColor: Color(0xff949D9E),
        suffixStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff949D9E)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
