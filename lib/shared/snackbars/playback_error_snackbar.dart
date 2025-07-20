import 'package:flutter/material.dart';

SnackBar playbackErrorSnackBar({
  required BuildContext context,
  required String contentText,
}) {
  return SnackBar(
    content: Text(
      contentText,
      style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
    ),
    backgroundColor: Theme.of(context).colorScheme.errorContainer,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 5),
  );
}
