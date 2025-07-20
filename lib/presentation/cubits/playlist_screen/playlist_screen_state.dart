part of 'playlist_screen_cubit.dart';

sealed class PlaylistScreenState extends Equatable {
  const PlaylistScreenState();

  @override
  List<Object?> get props => [];
}

final class PlaylistScreenInitial extends PlaylistScreenState {}

final class PlaylistLoadComplete extends PlaylistScreenState {
  final PlaylistModel playlistData;
  final List<TrackModel> playlistTrackList;
  final Map<String, List<PictureModel>> pictures;
  const PlaylistLoadComplete(
      {required this.playlistTrackList,
      required this.playlistData,
      required this.pictures});
  @override
  List<Object?> get props => [playlistData, playlistTrackList, pictures];
}

final class PlaylistLoadError extends PlaylistScreenState {
  const PlaylistLoadError();
}
