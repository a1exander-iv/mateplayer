import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/data/repositories/database_repository.dart';
import 'package:mate_player/domain/models/picture_model.dart';
import 'package:mate_player/domain/models/track_model.dart';

part 'stat_state.dart';

class StatCubit extends Cubit<StatState> {
  StatCubit(this.databaseRepository) : super(StatInitial());

  final DatabaseRepository databaseRepository;

  void load() async {
    final totalTracks = await databaseRepository.getTotalTracks();
    final totalListenedTimeInSeconds =
        await databaseRepository.getTotalListenedTimeInSeconds();
    final listenedTimeByTracks =
        await databaseRepository.getListenedTimeByTracks();
    final pictureMap = databaseRepository.pictureDataMap;
    emit(StatLoadComplete(
        totalListenedTimeInSeconds: totalListenedTimeInSeconds,
        totalTracks: totalTracks,
        listenedTimeInSecondsByTracksMap: listenedTimeByTracks,
        pictureDataMap: pictureMap));
  }

  void clearListeningHistory() async {
    await databaseRepository.clearListeningHistory();
  }
}
