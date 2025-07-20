import 'package:flutter/material.dart';

SnackBar playerRepeatModeSnackbar(
    {required BuildContext context, required String contentText}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    width: 450,
    content: Text(
      contentText,
    ),
    showCloseIcon: true,
    duration: const Duration(seconds: 2),
  );
}
