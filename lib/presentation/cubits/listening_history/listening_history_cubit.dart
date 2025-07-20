import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/data/repositories/database_repository.dart';
import 'package:mate_player/domain/models/track_model.dart';
import 'package:mate_player/shared/utils/path_parser_from_source.dart';

part 'listening_history_state.dart';

class ListeningHistoryCubit extends Cubit<ListeningHistoryState> {
  ListeningHistoryCubit(this._audioPlayer, this._databaseRepository)
      : super(ListeningHistoryInitial());
  final AudioPlayer _audioPlayer;
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _onPlayerStateChangedStreamSubscription;

  final Stopwatch _listeningTimer = Stopwatch();
  Source? _trackSource;

  void init() {
    _onPlayerStateChangedStreamSubscription =
        _audioPlayer.onPlayerStateChanged.listen((playerState) async {
      switch (playerState) {
        case PlayerState.playing:

          // count time between playing states
          if (_listeningTimer.isRunning) {
            _listeningTimer.stop();

            if (_trackSource != null &&
                _listeningTimer.elapsed.inSeconds >= 1) {
              TrackModel? track = _databaseRepository
                  .filePathTrackMap[pathFromPlayerSource(source: _trackSource)];

              if (track != null) {
                await _databaseRepository.addListenedTrackToHistory(
                    track: track,
                    listenedTimeInSeconds: _listeningTimer.elapsed.inSeconds);
              }
            }
          }

          _listeningTimer.reset();
          _listeningTimer.start();
          _trackSource = _audioPlayer.source;
          break;
        default:
          _listeningTimer.stop();

          if (_trackSource != null && _listeningTimer.elapsed.inSeconds >= 1) {
            TrackModel? track = _databaseRepository
                .filePathTrackMap[pathFromPlayerSource(source: _trackSource)];

            if (track != null) {
              await _databaseRepository.addListenedTrackToHistory(
                  track: track,
                  listenedTimeInSeconds: _listeningTimer.elapsed.inSeconds);
            }
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
