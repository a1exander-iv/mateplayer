import 'dart:typed_data' show Uint8List;

class PictureModel {
  final String trackPath;
  final Uint8List bytes;
  final String imageHash;
  final String? mimeType;
  final String? pictureType;
  const PictureModel(
      {required this.trackPath, required this.bytes, required this.imageHash, this.mimeType, this.pictureType});
}
