import 'package:mate_player/data/sources/db.dart';
import 'package:mate_player/domain/models/playlist_model.dart';

extension PlaylistMapper on PlaylistData {
  PlaylistModel toDomain() => PlaylistModel(
        id: id,
        name: name,
        imagePath: imagePath,
        createdTime: createdTime,
      );
}
