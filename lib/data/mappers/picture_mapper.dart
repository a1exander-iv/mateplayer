import 'package:drift/drift.dart' show Value;
import 'package:mate_player/data/sources/db.dart';
import 'package:mate_player/domain/models/picture_model.dart';

extension PictureMapper on PictureModel {
  PictureCompanion toCompanion() => PictureCompanion.insert(
      bytes: Value(bytes),
      pictureType: Value(pictureType),
      mimeType: Value(mimeType),
      trackPath: trackPath);
}

extension PictureDataMapper on PictureData {
  PictureModel toDomain() => PictureModel(
      mimeType: mimeType,
      bytes: bytes,
      pictureType: pictureType,
      trackPath: trackPath);
}
