import 'package:drift/drift.dart' show Value;
import 'package:mate_player/data/sources/db.dart';
import 'package:mate_player/domain/models/picture_model.dart';

extension PictureMapper on PictureModel {
  PictureCompanion toCompanion() => PictureCompanion.insert(
      imagePath: imagePath,
      imageHash: imageHash,
      pictureType: Value(pictureType),
      mimeType: Value(mimeType),
      trackPath: trackPath);
}

extension PictureDataMapper on PictureData {
  PictureModel toDomain() => PictureModel(
      mimeType: mimeType,
      imagePath: imagePath,
      imageHash: imageHash,
      pictureType: pictureType,
      trackPath: trackPath);
}
