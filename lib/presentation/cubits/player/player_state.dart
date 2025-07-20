part of 'player_cubit.dart';

final class PlayerCubitState extends Equatable {
  final PlayerState audioPlayerState;
  final Source? source;
  final bool shuffleMode;
  final RepeatMode repeatMode;
  final bool isNextButtonActive;
  final bool isPreviousButtonActive;
  final int? currentPlayingPlaylistId;
  final TrackModel? currentPlayingTrack;
  final bool playbackError;
  const PlayerCubitState(
      {required this.audioPlayerState,
      this.source,
      required this.repeatMode,
      required this.shuffleMode,
      required this.isNextButtonActive,
      required this.isPreviousButtonActive,
      this.currentPlayingTrack,
      this.currentPlayingPlaylistId,
      required this.playbackError});

  PlayerCubitState copyWith(
      {bool? shuffleMode,
      RepeatMode? repeatMode,
      int? currentPlayingPlaylistId,
      bool? playbackError}) {
    return PlayerCubitState(
        audioPlayerState: audioPlayerState,
        repeatMode: repeatMode ?? this.repeatMode,
        shuffleMode: shuffleMode ?? this.shuffleMode,
        source: source,
        isNextButtonActive: isNextButtonActive,
        isPreviousButtonActive: isPreviousButtonActive,
        currentPlayingTrack: currentPlayingTrack,
        currentPlayingPlaylistId:
            currentPlayingPlaylistId ?? this.currentPlayingPlaylistId,
        playbackError: playbackError ?? this.playbackError);
  }

  @override
  List<Object?> get props => [
        audioPlayerState,
        source,
        shuffleMode,
        repeatMode,
        isNextButtonActive,
        isPreviousButtonActive,
        currentPlayingPlaylistId,
        currentPlayingTrack,
        playbackError
      ];
}
