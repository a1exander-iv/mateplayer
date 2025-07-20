import 'package:mate_player/data/sources/db.dart' show PlaylistTrackData;
import 'package:mate_player/domain/models/playlist_track_model.dart';

extension PlaylistTrackMapper on PlaylistTrackData {
  PlaylistTrackModel toDomain() => PlaylistTrackModel(
      trackId: trackId,
      playlistId: playlistId,
      position: position,
      createdTime: createdTime);
}
