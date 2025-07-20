part of 'track_short_info_cubit.dart';

sealed class TrackShortInfoState extends Equatable {
  const TrackShortInfoState();

  @override
  List<Object?> get props => [];
}

final class TrackShortInfoInitial extends TrackShortInfoState {
  const TrackShortInfoInitial();
}

final class TrackShortInfoLoadComplete extends TrackShortInfoState {
  final TrackModel playingTrack;
  const TrackShortInfoLoadComplete(
    this.playingTrack,
  );

  @override
  List<Object?> get props => [playingTrack];
}
