import 'package:flutter/material.dart';

void showCustomSnackbar(
  BuildContext context,
  String message, {
  bool isSuccess = true,
}) {
  final color = isSuccess ? Colors.green : Colors.red;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      duration: Duration(seconds: 3),
    ),
  );
}
