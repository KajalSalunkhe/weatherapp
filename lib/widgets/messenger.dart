import 'package:flutter/material.dart';

class ToastMessenger {
  static void errorMessageShow(BuildContext context, String message) {
    show(context, message, backgroundColor: Colors.red);
  }

  static void show(BuildContext context, String message,
      {Color? backgroundColor, int? seconds, SnackBarAction? action}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        // margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        action: action,
        duration: seconds == null
            ? const Duration(milliseconds: 4000)
            : Duration(seconds: seconds),
      ),
    );
  }
}
