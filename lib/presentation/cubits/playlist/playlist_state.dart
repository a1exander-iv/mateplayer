part of 'playlist_cubit.dart';

sealed class PlaylistState extends Equatable {
  const PlaylistState();
  @override
  List<Object?> get props => [];
}

final class PlaylistInitial extends PlaylistState {
  const PlaylistInitial();
}

final class PlaylistCatalogLoadComplete extends PlaylistState {
  final List<PlaylistModel> playlistCatalog;

  const PlaylistCatalogLoadComplete({required this.playlistCatalog});

  @override
  List<Object?> get props => [playlistCatalog];
}
