class PictureModel {
  final String trackPath;
  final String imagePath;
  final String imageHash;
  final String? mimeType;
  final String? pictureType;
  const PictureModel({
    required this.trackPath,
    required this.imagePath,
    required this.imageHash,
    this.mimeType,
    this.pictureType,
  });
}
