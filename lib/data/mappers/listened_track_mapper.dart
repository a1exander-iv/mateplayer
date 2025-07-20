import 'package:mate_player/data/sources/db.dart' show ListenedTrackData;
import 'package:mate_player/domain/models/listened_track_model.dart';

extension ListenedTrackMapper on ListenedTrackData {
  ListenedTrackModel toDomain() => ListenedTrackModel(
      trackId: trackId,
      listenedTimeInSeconds: listenedTimeInSeconds,
      createdTime: createdTime);
}
