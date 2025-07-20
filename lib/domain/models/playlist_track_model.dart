class PlaylistTrackModel {
  final int trackId;
  final int playlistId;
  final int position;
  final DateTime createdTime;
  const PlaylistTrackModel(
      {required this.trackId,
      required this.playlistId,
      required this.position,
      required this.createdTime});
}
