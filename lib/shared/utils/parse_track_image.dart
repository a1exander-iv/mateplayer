import 'package:mate_player/domain/models/picture_model.dart';

String? parseTrackImagePath(
  Map<String, List<PictureModel>> picturesMap,
  String trackPath,
) {
  List<PictureModel>? pictureDataList = picturesMap[trackPath];
  if (pictureDataList != null && pictureDataList.isNotEmpty) {
    for (var pictureData in pictureDataList) {
      return pictureData.imagePath;
    }
  }

  return null;
}

List<String?> parsePicturePathList(
  Map<String, List<PictureModel>> picturesMap,
  String trackPath,
) {
  List<PictureModel>? pictureDataList = picturesMap[trackPath];
  List<String?> imagePathList = [];
  if (pictureDataList != null && pictureDataList.isNotEmpty) {
    for (var pictureData in pictureDataList) {
      imagePathList.add(pictureData.imagePath);
    }
    return imagePathList;
  }

  return [];
}
