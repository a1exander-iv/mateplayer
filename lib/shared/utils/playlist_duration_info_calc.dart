import 'package:mate_player/domain/models/track_model.dart';

(int, int, int) playlistDurationInfoCalc(List<TrackModel> trackList) {
  final totalDurationInMilliseconds = trackList.fold<int>(
    0,
    (sum, track) => sum + (track.trackDurationInMilliseconds ?? 0),
  );

  if (totalDurationInMilliseconds == 0) return (0, 0, 0);

  int totalSeconds = totalDurationInMilliseconds ~/ 1000;

  int hours = totalSeconds ~/ 3600;
  int minutes = (totalSeconds % 3600) ~/ 60;
  int seconds = (totalSeconds % 3600) % 60;

  return (hours, minutes, seconds);
}
