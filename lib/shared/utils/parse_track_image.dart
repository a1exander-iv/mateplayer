import 'dart:typed_data' show Uint8List;

import 'package:mate_player/domain/models/picture_model.dart';

Uint8List? parseTrackImage(
    Map<String, List<PictureModel>> picturesMap, String trackPath) {
  List<PictureModel>? pictureDataList = picturesMap[trackPath];
  if (pictureDataList != null && pictureDataList.isNotEmpty) {
    for (var pictureData in pictureDataList) {
      return pictureData.bytes;
    }
  }

  return null;
}

List<Uint8List?> parsePictureList(
    Map<String, List<PictureModel>> picturesMap, String trackPath) {
  List<PictureModel>? pictureDataList = picturesMap[trackPath];
  List<Uint8List?> imageBytesList = [];
  if (pictureDataList != null && pictureDataList.isNotEmpty) {
    for (var pictureData in pictureDataList) {
      imageBytesList.add(pictureData.bytes);
    }
    return imageBytesList;
  }

  return [];
}
