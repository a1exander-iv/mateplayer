part of 'favorite_screen_cubit.dart';

sealed class FavoriteScreenState extends Equatable {
  const FavoriteScreenState();

  @override
  List<Object> get props => [];
}

final class FavoriteScreenInitial extends FavoriteScreenState {}

final class FavoriteScreenLoadComplete extends FavoriteScreenState {

  final List<PlaylistModel> favoritePlaylistData;
  final List<TrackModel> favoriteTrackData;

  const FavoriteScreenLoadComplete({required this.favoritePlaylistData, required this.favoriteTrackData});

  @override
  List<Object> get props => [favoritePlaylistData, favoriteTrackData];

}