import 'package:mate_player/data/sources/db.dart' show FavoriteTrackData;
import 'package:mate_player/domain/models/favorite_track_model.dart';


extension FavoriteTrackMapper on FavoriteTrackData {
  FavoriteTrackModel toDomain() =>
      FavoriteTrackModel(createdTime: createdTime, trackId: trackId);
}
