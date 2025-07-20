class ListenedTrackModel {
  final int trackId;
  final int listenedTimeInSeconds;
  final DateTime createdTime;
  const ListenedTrackModel(
      {required this.trackId,
      required this.listenedTimeInSeconds,
      required this.createdTime});
}
