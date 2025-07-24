import 'dart:typed_data' show Uint8List;

import 'package:crypto/crypto.dart';

String imageHash({required Uint8List bytes}) {
  return sha256.convert(bytes).toString();
}
