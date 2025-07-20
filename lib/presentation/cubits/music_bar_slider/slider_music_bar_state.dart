part of 'slider_music_bar_cubit.dart';

final class SliderMusicBarState extends Equatable {
  final Duration currentPosition;
  final Duration trackLength;

  const SliderMusicBarState(
      {required this.currentPosition, required this.trackLength});

  SliderMusicBarState copyWith(
      {Duration? currentPosition, Duration? trackLength}) {
    return SliderMusicBarState(
        currentPosition: currentPosition ?? this.currentPosition,
        trackLength: trackLength ?? this.trackLength);
  }

  @override
  List<Object?> get props => [currentPosition, trackLength];
}
