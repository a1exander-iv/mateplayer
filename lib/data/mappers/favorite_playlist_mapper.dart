import 'package:mate_player/data/sources/db.dart' show FavoritePlaylistData;
import 'package:mate_player/domain/models/favorite_playlist_model.dart';

extension FavoritePlaylistMapper on FavoritePlaylistData {
  FavoritePlaylistModel toDomain() =>
      FavoritePlaylistModel(createdTime: createdTime, playlistId: playlistId);
}
