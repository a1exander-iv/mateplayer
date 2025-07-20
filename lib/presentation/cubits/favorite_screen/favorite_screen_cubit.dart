import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/data/repositories/database_repository.dart';

import 'package:mate_player/domain/models/playlist_model.dart';
import 'package:mate_player/domain/models/track_model.dart';

part 'favorite_screen_state.dart';

class FavoriteScreenCubit extends Cubit<FavoriteScreenState> {
  FavoriteScreenCubit(this.databaseRepository) : super(FavoriteScreenInitial());

  final DatabaseRepository databaseRepository;
  StreamSubscription? _allFavoriteDataSubscription;
  void init() {
     databaseRepository.watchAllFavoriteData().listen((value) {
      emit(FavoriteScreenLoadComplete(
          favoritePlaylistData: value.$1, favoriteTrackData: value.$2));
    });
  }

  @override
  Future<void> close() {
    _allFavoriteDataSubscription?.cancel();
    return super.close();
  }
}
