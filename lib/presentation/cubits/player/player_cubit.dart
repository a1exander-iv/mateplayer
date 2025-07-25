import 'dart:async';
import 'dart:math' show Random;

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:mate_player/data/repositories/audio_player_repository.dart';
import 'package:mate_player/data/repositories/database_repository.dart';
import 'package:mate_player/domain/models/track_model.dart';
import 'package:mate_player/presentation/enums/repeat_mode_enum.dart';
import 'package:mate_player/shared/utils/parse_track_image.dart';
import 'package:mate_player/shared/utils/path_parser_from_source.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerCubitState> {
  PlayerCubit(this.audioPlayerRepository, {required this.databaseRepository})
      : super(PlayerCubitState(
            audioPlayerState: PlayerState.stopped,
            shuffleMode: false,
            repeatMode: RepeatMode.noRepeat,
            isNextButtonActive: true,
            isPreviousButtonActive: true,
            playbackError: false));

  final DatabaseRepository databaseRepository;

  final AudioPlayerRepository audioPlayerRepository;

  StreamSubscription? _playerStateStreamSubscription;

  List<TrackModel> _trackSequence = [];

  bool _shuffleMode = false;
  RepeatMode _repeatMode = RepeatMode.noRepeat;

  int? _currentPlayingTrackIndexInSequenceList;
  int? _currentPlayingPlaylistId;

  bool _isNextButtonActive = true;
  bool _isPreviousButtonActive = true;
  bool _playbackError = false;
  final Map<String, int> _trackIndexSequenceMap = {};
  set setTrackSequenceList(List<TrackModel> trackList) {
    _trackSequence = trackList;
    for (int i = 0; i < _trackSequence.length; i++) {
      _trackIndexSequenceMap[_trackSequence[i].filePath] = i;
    }
  }

  set setCurrentPlayingPlaylistId(int? playlistId) {
    _currentPlayingPlaylistId = playlistId;
  }

  List<TrackModel> get getTrackSequenceList => _trackSequence;
  int? get getCurrentPlayingPlaylist => _currentPlayingPlaylistId;
  Map<String, int> get trackIndexSequenceMap => _trackIndexSequenceMap;
  int? get getCurrentPlayingTrackIndexInSequenceList =>
      _currentPlayingTrackIndexInSequenceList;

  void init() {
    _playerStateStreamSubscription =
        audioPlayerRepository.onPlayerStateChanged.listen((playerState) {
      if (playerState == PlayerState.playing) {
       
        _currentPlayingTrackIndexInSequenceList = _trackIndexSequenceMap[
            pathFromPlayerSource(source: audioPlayerRepository.source)];


        if (_currentPlayingTrackIndexInSequenceList ==
            _trackSequence.length - 1) {
          _isNextButtonActive = false;
        } else {
          _isNextButtonActive = true;
        }

        if (_currentPlayingTrackIndexInSequenceList == 0) {
          _isPreviousButtonActive = false;
        } else {
          _isPreviousButtonActive = true;
        }
      } else if (playerState == PlayerState.disposed ||
          playerState == PlayerState.stopped) {
        _currentPlayingPlaylistId = null;
        _currentPlayingTrackIndexInSequenceList = null;
      }

      if (_currentPlayingTrackIndexInSequenceList == null ||
          _currentPlayingTrackIndexInSequenceList! < 0 ||
          _trackSequence.isEmpty) {
        emit(PlayerCubitState(
            audioPlayerState: PlayerState.stopped,
            repeatMode: _repeatMode,
            shuffleMode: _shuffleMode,
            isNextButtonActive: _isNextButtonActive,
            isPreviousButtonActive: _isPreviousButtonActive,
            playbackError: _playbackError));
      } else {
        emit(PlayerCubitState(
            audioPlayerState: playerState,
            shuffleMode: _shuffleMode,
            repeatMode: _repeatMode,
            source: audioPlayerRepository.source,
            isNextButtonActive: _isNextButtonActive,
            isPreviousButtonActive: _isPreviousButtonActive,
            currentPlayingTrack:
                _trackSequence[_currentPlayingTrackIndexInSequenceList!],
            currentPlayingPlaylistId: _currentPlayingPlaylistId,
            playbackError: _playbackError));
      }
    });

    audioPlayerRepository.onPlayerComplete.listen((_) async {
      if (_currentPlayingTrackIndexInSequenceList == null) return;

      switch (_repeatMode) {
        case RepeatMode.noRepeat:
          if (_shuffleMode) {
            int shuffleIndex = _calcNextShuffleIndex(
                trackSequenceLength: _trackSequence.length,
                currentPlayingTrackIndexInSequenceList:
                    _currentPlayingTrackIndexInSequenceList!);
            await _play(
              _trackSequence[shuffleIndex],
            );
            break;
          }

          if (_currentPlayingTrackIndexInSequenceList! <
              _trackSequence.length - 1) {
            await _play(
                _trackSequence[_currentPlayingTrackIndexInSequenceList! + 1]);
            break;
          } else {
            await audioPlayerRepository.stop();
          }

        case RepeatMode.repeatOneTrack:
          await _play(_trackSequence[_currentPlayingTrackIndexInSequenceList!]);
          break;
        case RepeatMode.repeatAllPlaylistAfterCompleted:
          if (_shuffleMode) {
            int shuffleIndex = _calcNextShuffleIndex(
                trackSequenceLength: _trackSequence.length,
                currentPlayingTrackIndexInSequenceList:
                    _currentPlayingTrackIndexInSequenceList!);
            await _play(_trackSequence[shuffleIndex]);
            break;
          }

          if (_currentPlayingTrackIndexInSequenceList ==
              _trackSequence.length - 1) {
            await _play(_trackSequence.first);
          } else {
            await _play(
                _trackSequence[_currentPlayingTrackIndexInSequenceList! + 1]);
          }
      }
    });
  }

  Future<void> _pause() async {
    if (_playbackError) {
      return;
    }
    await audioPlayerRepository.pause();
  }

  Future<void> _resume() async {
    if (_playbackError) {
      return;
    }

    await audioPlayerRepository.resume();
  }

  Future<void> _play(TrackModel track) async {
    //restore playbackError in database if track playback is successful
    if (_playbackError == false && track.playbackError == true) {
      await databaseRepository.setTrackPlaybackError(track.id, false);
    }

    // error in audioplayer does not reset source
    if (_playbackError &&
        track.filePath ==
            pathFromPlayerSource(source: audioPlayerRepository.source)) {
      return;
    }

    try {
      await audioPlayerRepository.play(track,
          parseTrackImagePath(databaseRepository.pictureDataMap, track.filePath));
      _playbackError = false;
    } catch (e, s) {
      _playbackError = true;
      await audioPlayerRepository.stop();
      await databaseRepository.setTrackPlaybackError(track.id, true);
      emit(state.copyWith(playbackError: _playbackError));
      debugPrint("$e, $s");
    }
  }

  Future<void> tilePlay({
    required TrackModel track,
  }) async {
    switch (audioPlayerRepository.state) {
      case PlayerState.stopped:
        await _play(track);
      case PlayerState.playing:
        if (track.filePath ==
            pathFromPlayerSource(source: audioPlayerRepository.source)) {
          await _pause();
        } else {
          await _play(track);
        }
      case PlayerState.paused:
        if (track.filePath ==
            pathFromPlayerSource(source: audioPlayerRepository.source)) {
          await _resume();
        } else {
          await _play(track);
        }
      case PlayerState.completed:
        await _play(track);
      case PlayerState.disposed:
        await _play(track);
    }
  }

  void playAndPause() async {
    switch (audioPlayerRepository.audioPlayer.state) {
      case PlayerState.playing:
        await _pause();
      case PlayerState.paused:
        await _resume();
      default:
        await _resume();
    }
  }

  void mainListTilePlay({required TrackModel track, required List<TrackModel> audioList,}) {

    setTrackSequenceList = audioList;
    _currentPlayingPlaylistId = null;
    tilePlay(track: track);
  }

  void playlistTilePlay({required TrackModel track, required List<TrackModel> audioList, required int playlistId}) {

    setTrackSequenceList = audioList;
    _currentPlayingPlaylistId = playlistId;
    tilePlay(track: track);

  }
  void onNextButtonPressed() async {
    if (_currentPlayingTrackIndexInSequenceList == null) return;

    final trackIndexInSequenceList = _currentPlayingTrackIndexInSequenceList!;

    if (trackIndexInSequenceList < _trackSequence.length - 1) {
      await _play(_trackSequence[trackIndexInSequenceList + 1]);
    }
  }

  void onPreviousButtonPressed() async {
    if (_currentPlayingTrackIndexInSequenceList == null) return;

    final trackIndexInSequenceList = _currentPlayingTrackIndexInSequenceList!;
    if (trackIndexInSequenceList > 0) {
      await _play(_trackSequence[trackIndexInSequenceList - 1]);
    }
  }

  void onShuffleButtonPressed() {
    _shuffleMode = !_shuffleMode;
    emit(state.copyWith(shuffleMode: _shuffleMode));
  }

  void onRepeatButtonPressed() {
    switch (_repeatMode) {
      case RepeatMode.noRepeat:
        _repeatMode = RepeatMode.repeatAllPlaylistAfterCompleted;
      case RepeatMode.repeatAllPlaylistAfterCompleted:
        _repeatMode = RepeatMode.repeatOneTrack;
      case RepeatMode.repeatOneTrack:
        _repeatMode = RepeatMode.noRepeat;
    }

    emit(state.copyWith(repeatMode: _repeatMode));
  }

  void playlistPlayAndPause(
      List<TrackModel> playlistTrackList, int playlistId) async {
    if (playlistId == _currentPlayingPlaylistId &&
        state.audioPlayerState != PlayerState.stopped) {
      playAndPause();
      return;
    }

    if (playlistTrackList.isNotEmpty) {
      setTrackSequenceList = playlistTrackList;
      await _play(_trackSequence.first);
      _currentPlayingPlaylistId = playlistId;
      emit(state.copyWith(currentPlayingPlaylistId: playlistId));
    }
  }

  void reorderSequenceListByPlaylistIdsList(
      {required List<int> playlistIdsList}) {
    if (_trackSequence.isEmpty) return;
    Map<int, TrackModel> sequenceMap = {};

    for (var track in _trackSequence) {
      sequenceMap[track.id] = track;
    }

    List<TrackModel> reorderedSequenceList =
        playlistIdsList.map((id) => sequenceMap[id]!).toList();

    setTrackSequenceList = reorderedSequenceList;

    _currentPlayingTrackIndexInSequenceList = _trackIndexSequenceMap[
        pathFromPlayerSource(source: audioPlayerRepository.source)];
   
  }

  int _calcNextShuffleIndex(
      {required int trackSequenceLength,
      required int currentPlayingTrackIndexInSequenceList}) {
    List<int> shuffleIndexes = [];
    for (int i = 0; i < _trackSequence.length; i++) {
      if (i == currentPlayingTrackIndexInSequenceList) continue;
      shuffleIndexes.add(i);
    }

    return shuffleIndexes[Random().nextInt(shuffleIndexes.length)];
  }

  void addSublistSequenceWidget(
    List<TrackModel> sublist,
  ) {
    int? toIndex = _currentPlayingTrackIndexInSequenceList;
    if (toIndex != null && toIndex < _trackSequence.length) {
      List<TrackModel> sequenceList = _trackSequence.sublist(0, toIndex + 1);
      sequenceList.addAll(sublist);
      setTrackSequenceList = sequenceList;
    }
  }

  void stop() {
    audioPlayerRepository.stop();
    _currentPlayingTrackIndexInSequenceList = null;
  }

  @override
  Future<void> close() {
    _playerStateStreamSubscription?.cancel();
    return super.close();
  }
}
