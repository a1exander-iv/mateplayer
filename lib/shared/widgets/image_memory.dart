import 'dart:typed_data' show Uint8List;
import 'package:flutter/material.dart';

class ImageMemory extends StatelessWidget {
  final Uint8List bytes;
  final int? cacheHeight;
  final int? cacheWidth;
  final BoxFit? fit;

  const ImageMemory(
      {super.key,
      required this.bytes,
      this.cacheHeight,
      this.cacheWidth,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      fit: fit,
      bytes,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      filterQuality: FilterQuality.high,
    );
  }
}
