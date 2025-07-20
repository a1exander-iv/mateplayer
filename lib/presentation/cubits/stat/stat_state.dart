part of 'stat_cubit.dart';

sealed class StatState extends Equatable {
  const StatState();

  @override
  List<Object> get props => [];
}

final class StatInitial extends StatState {}

final class StatLoadComplete extends StatState {
  final int totalListenedTimeInSeconds;
  final int totalTracks;
  final Map<TrackModel, int> listenedTimeInSecondsByTracksMap;
  final Map<String, List<PictureModel>> pictureDataMap;

  @override
  List<Object> get props => [
        totalListenedTimeInSeconds,
        totalTracks,
        listenedTimeInSecondsByTracksMap,
        pictureDataMap
      ];

  const StatLoadComplete(
      {required this.totalListenedTimeInSeconds,
      required this.totalTracks,
      required this.listenedTimeInSecondsByTracksMap,
      required this.pictureDataMap});
}
