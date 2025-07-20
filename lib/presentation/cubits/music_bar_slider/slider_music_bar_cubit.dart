import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'slider_music_bar_state.dart';

class SliderMusicBarCubit extends Cubit<SliderMusicBarState> {
  SliderMusicBarCubit({required this.audioPlayer})
      : super(SliderMusicBarState(
            currentPosition: Duration.zero, trackLength: Duration.zero));

  final AudioPlayer audioPlayer;

  StreamSubscription? _onPositionChangedSubscription;
  StreamSubscription? _onDurationChangedSubscription;

  void init() {
    _onPositionChangedSubscription =
        audioPlayer.onPositionChanged.listen((value) {
      emit(state.copyWith(currentPosition: value));
    });

    _onDurationChangedSubscription =
        audioPlayer.onDurationChanged.listen((value) {
      emit(state.copyWith(trackLength: value));
    });
  }

  void pauseOnPositionChangedSubscription() {
    _onPositionChangedSubscription?.pause();
  }

  void resumeOnPositionChangedSubscription() {
    _onPositionChangedSubscription?.resume();
  }

  Future<void> setNewPositionValue(Duration value) async {
    await audioPlayer.seek(value);
  }

  void updateCurrentPositionValue(Duration value) {
    emit(state.copyWith(currentPosition: value));
  }

  @override
  Future<void> close() {
    _onDurationChangedSubscription?.cancel();
    _onPositionChangedSubscription?.cancel();
    return super.close();
  }
}
