import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/data/repositories/database_repository.dart';
import 'package:mate_player/domain/models/track_model.dart';
import 'package:mate_player/shared/utils/path_parser_from_source.dart';

part 'track_short_info_state.dart';

class TrackShortInfoCubit extends Cubit<TrackShortInfoState> {
  TrackShortInfoCubit(this._audioPlayer, this._databaseRepository)
      : super(TrackShortInfoInitial());

  final AudioPlayer _audioPlayer;
  final DatabaseRepository _databaseRepository;

  StreamSubscription? _onPlayerStateChangedStreamSubscription;

  void init() {
    _onPlayerStateChangedStreamSubscription =
        _audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == PlayerState.playing) {
        TrackModel? currentPlayingTrack = _databaseRepository.filePathTrackMap[
            pathFromPlayerSource(source: _audioPlayer.source)];
        if (currentPlayingTrack != null) {
          emit(TrackShortInfoLoadComplete(
            currentPlayingTrack,
          ));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _onPlayerStateChangedStreamSubscription?.cancel();
    return super.close();
  }
}
