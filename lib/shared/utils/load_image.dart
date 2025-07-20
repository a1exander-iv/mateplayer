import 'dart:io' show File;
import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart' show debugPrint;

Uint8List? loadImageBytes(String? imagePath) {
  if (imagePath == null) return null;
  try {
    final file = File(imagePath);
    if (file.existsSync()) {
      return file.readAsBytesSync();
    }
  } catch (e) {
    debugPrint('Error reading image file: $e');
  }
  return null;
}
