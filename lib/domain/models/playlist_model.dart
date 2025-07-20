class PlaylistModel {
  final int id;
  final String? name;
  final String? imagePath;
  final DateTime createdTime;
  const PlaylistModel(
      {required this.id, this.name, this.imagePath, required this.createdTime});
}
