import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/data/repositories/database_repository.dart';

import 'package:mate_player/domain/models/picture_model.dart';
import 'package:mate_player/domain/models/playlist_model.dart';
import 'package:mate_player/domain/models/track_model.dart';

part 'playlist_screen_state.dart';

class PlaylistScreenCubit extends Cubit<PlaylistScreenState> {
  PlaylistScreenCubit(this._databaseRepository)
      : super(PlaylistScreenInitial());

  final DatabaseRepository _databaseRepository;
  StreamSubscription? _trackListSubscription;
  StreamSubscription? _allPlaylistsDataSubscription;

  void load(int playlistId) async {
    _trackListSubscription = _databaseRepository
        .watchAllPlaylistTrackData(playlistId)
        .listen((playlistTrackList) async {
      final List<TrackModel> trackList =
          await _databaseRepository.getTrackListById(playlistTrackList
              .map((playlistTrack) => playlistTrack.trackId)
              .toList());
      final PlaylistModel playlistData =
          await _databaseRepository.getPlaylistInfo(playlistId);

      emit(PlaylistLoadComplete(
          playlistTrackList: trackList,
          playlistData: playlistData,
          pictures: _databaseRepository.pictureDataMap));
    });
  }

  void cancelSubscription() {
    _trackListSubscription?.cancel();
    _allPlaylistsDataSubscription?.cancel();
  }

  @override
  Future<void> close() {
    _trackListSubscription?.cancel();
    _allPlaylistsDataSubscription?.cancel();
    return super.close();
  }
}
