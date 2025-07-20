import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/data/repositories/database_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.databaseRepository) : super(FavoriteInitial());

  StreamSubscription? _favoriteTrackStreamSubscription;
  StreamSubscription? _favoritePlaylistStreamSubscription;
  final DatabaseRepository databaseRepository;

  Map<int, DateTime> _tracksFavoriteMap = {};
  Map<int, DateTime> _playlistFavoriteMap = {};

  void init() {
    _favoriteTrackStreamSubscription =
        databaseRepository.watchAllFavoriteTracks().listen((data) {
      _tracksFavoriteMap = {
        for (var track in data) track.trackId: track.createdTime
      };
      emit(FavoriteInfoLoadComplete(
          playlistFavoriteMap: _playlistFavoriteMap,
          tracksFavoriteMap: _tracksFavoriteMap));
    });

    _favoritePlaylistStreamSubscription =
        databaseRepository.watchAllFavoritePlaylist().listen((data) {
      _playlistFavoriteMap = {
        for (var favoritePlaylist in data)
          favoritePlaylist.playlistId: favoritePlaylist.createdTime
      };
      emit(FavoriteInfoLoadComplete(
          playlistFavoriteMap: _playlistFavoriteMap,
          tracksFavoriteMap: _tracksFavoriteMap));
    });
  }

  void setFavoriteTrack(int trackId, bool favorite) {
    if (!favorite) {
      databaseRepository.setFavoriteTrack(trackId);
    } else {
      databaseRepository.removeFavoriteTrack(trackId);
    }
  }

  void setFavoritePlaylist(int playlistId, bool favorite) {
    if (!favorite) {
      databaseRepository.setFavoritePlaylist(playlistId);
    } else {
      databaseRepository.removeFavoritePlaylist(playlistId);
    }
  }

  
  @override
  Future<void> close() {
    _favoritePlaylistStreamSubscription?.cancel();
    _favoriteTrackStreamSubscription?.cancel();
    return super.close();
  }
}
