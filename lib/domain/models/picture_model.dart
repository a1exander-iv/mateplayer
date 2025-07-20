import 'dart:typed_data' show Uint8List;

class PictureModel {
  final String trackPath;
  final Uint8List? bytes;
  final String? mimeType;
  final String? pictureType;
  const PictureModel(
      {required this.trackPath, this.bytes, this.mimeType, this.pictureType});
}
