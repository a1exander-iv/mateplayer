import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/data/repositories/database_repository.dart';
import 'package:mate_player/data/repositories/settings_repository.dart';

import 'package:mate_player/domain/models/picture_model.dart';

part 'pictures_state.dart';

class PicturesCubit extends Cubit<PicturesState> {
  PicturesCubit(this._databaseRepository, this._settingsRepository) : super(PicturesInitial());

  StreamSubscription? _streamSubscription;
  final DatabaseRepository _databaseRepository;
  final SettingsRepository _settingsRepository;

  void init() {
    if (_settingsRepository.getTrackImagesLoadValue() == true) {
      _streamSubscription = _databaseRepository.watchPictures().listen((dataMap) {
      emit(PicturesLoadComplete(picturesDataMap: dataMap));
    });
    }
  }

  void clearPicturesAndCancelSubscription() {
    _databaseRepository.pictureDataMap.clear();
    _streamSubscription?.cancel();
    emit(PicturesInitial());
  }

  void resumePictureLoading() {
     _streamSubscription = _databaseRepository.watchPictures().listen((dataMap) {
      emit(PicturesLoadComplete(picturesDataMap: dataMap));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
