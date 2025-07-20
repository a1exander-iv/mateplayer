part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteInfoLoadComplete extends FavoriteState {

  final Map<int, DateTime> tracksFavoriteMap;
  final Map<int, DateTime> playlistFavoriteMap;

  const FavoriteInfoLoadComplete({required this.playlistFavoriteMap, required this.tracksFavoriteMap});

  FavoriteInfoLoadComplete copyWith({Map<int, DateTime>? tracksFavoriteMap, Map<int, DateTime>? playlistFavoriteMap}) {
    return FavoriteInfoLoadComplete(playlistFavoriteMap: playlistFavoriteMap ?? this.playlistFavoriteMap, tracksFavoriteMap: tracksFavoriteMap ?? this.playlistFavoriteMap);
  }
   @override
  List<Object> get props => [tracksFavoriteMap, playlistFavoriteMap];

}