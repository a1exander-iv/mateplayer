import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/data/repositories/audio_player_repository.dart';

part 'volume_slider_state.dart';

class VolumeSliderCubit extends Cubit<VolumeSliderState> {
  VolumeSliderCubit(
      {double initSliderValue = 100, required this.audioPlayerRepository})
      : super(VolumeSliderState(sliderValue: initSliderValue)) {
    player = audioPlayerRepository.audioPlayer;
    player.setVolume(initSliderValue);
  }

  late final AudioPlayer player;

  final AudioPlayerRepository audioPlayerRepository;

  double? _lastVolumeSliderValue;

  void changeVolumeSliderValue(double newValue) {
    double playerValue = newValue / 100;
    player.setVolume(playerValue);
    emit(VolumeSliderState(sliderValue: newValue));
  }

  void setLastVolumeValue(double newValue) {
    _lastVolumeSliderValue = newValue;
  }

  void onMuteVolumeButtonPressed() {
    if (state.sliderValue > 0) {
      _lastVolumeSliderValue = state.sliderValue;
      changeVolumeSliderValue(0);
    } else {
      _lastVolumeSliderValue == null
          ? changeVolumeSliderValue(0)
          : changeVolumeSliderValue(_lastVolumeSliderValue!);
    }
  }
}
