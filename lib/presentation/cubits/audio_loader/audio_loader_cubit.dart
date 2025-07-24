import 'dart:async';
import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/data/models/models.dart';
import 'package:mate_player/data/repositories/database_repository.dart';
import 'package:mate_player/data/repositories/metadata_repository.dart';
import 'package:mate_player/domain/models/picture_model.dart' show PictureModel;
import 'package:mate_player/domain/models/track_entry_model.dart';
import 'package:mate_player/domain/models/track_model.dart';
import 'package:mate_player/presentation/enums/select_sorting_enum.dart';
import 'package:mate_player/shared/utils/allowed_file_extension.dart';
import 'package:path/path.dart';

part 'audio_loader_state.dart';

class AudioLoaderCubit extends Cubit<AudioLoaderState> {
  AudioLoaderCubit(this._trackMetadataRepository, this._databaseRepository,)
      : super(AudioLoaderInitial());

  final TrackMetadataRepository _trackMetadataRepository;
  final DatabaseRepository _databaseRepository;


  StreamSubscription? _allTracksStreamSubscription;

  final List<String> _exceptionFilePathList = [];

  void init() {
    _loadAudioTracksFromDatabase();

    _allTracksStreamSubscription = _databaseRepository
        .trackListStreamController.stream
        .listen((trackList) {
      emit(AudioLoadComplete(
        audioList: trackList,
        exceptionFilePathList: _exceptionFilePathList,
      ));
    });
  }

  void loadNewDirectory(String directoryPath) async {
    final insertedTrackPathSet = await addAudioTracksToDb(directories: [Directory(directoryPath)]);
    if (insertedTrackPathSet.isEmpty) {
      _loadAudioTracksFromDatabase();
    }
  }

  void _loadAudioTracksFromDatabase() async {
    List<TrackModel> trackList =  await _databaseRepository.readAllTracksFromDb;
    emit(AudioLoadComplete(audioList: trackList, exceptionFilePathList: _exceptionFilePathList));
  }

  void sort(SelectSortingEnum value) {
    switch (value) {
      case SelectSortingEnum.byDurationAscending:
        _databaseRepository.listenAllTracksByDuration(ascending: true);
      case SelectSortingEnum.byDurationDescending:
        _databaseRepository.listenAllTracksByDuration(ascending: false);
      case SelectSortingEnum.byDateAddedAscending:
        _databaseRepository.listenAllTracksByDateAdded(ascending: true);
      case SelectSortingEnum.byDateAddedDescending:
        _databaseRepository.listenAllTracksByDateAdded(ascending: false);
      case SelectSortingEnum.byTitleAscending:
        _databaseRepository.listenAllTracksByTitle(ascending: true);
      case SelectSortingEnum.byTitleDescending:
        _databaseRepository.listenAllTracksByTitle(ascending: false);
      case SelectSortingEnum.byYearAscending:
        _databaseRepository.listenAllTracksByYear(ascending: true);
      case SelectSortingEnum.byYearDescending:
        _databaseRepository.listenAllTracksByYear(ascending: false);
      case SelectSortingEnum.byFileNameAscending:
        _databaseRepository.listenAllTracksByFileName(ascending: true);
      case SelectSortingEnum.byFileNameDescending:
        _databaseRepository.listenAllTracksByFileName(ascending: false);
      case SelectSortingEnum.withoutSorting:
        _databaseRepository.listenAllTracksWithoutSorting();
    }
  }

  Future<Set<String>> addAudioTracksToDb({required List<Directory> directories}) async {

    Set<String> insertedTrackPathSet = {};

    emit(AudioLoadingInitial());

    _allTracksStreamSubscription?.pause();
  
    List<TrackEntryModel> trackEntriesList = [];
    List<Directory> loadedDirectories = [];
    List<PictureModel> pictureList = [];
    for (var directory in directories) {
      try {
        final List<FileSystemEntity> fileSystemEntities =
            await directory.list().toList();

        final List<File> audioFiles =
            fileSystemEntities.whereType<File>().where((fileElement) {
          return checkAllowedFileExtension(fileElement.path);
        }).toList();

        List<List<String>> pathList = [];
        int slice = 20;
        for (int i = 0; i < audioFiles.length; i += slice) {
          int? end;
          if (i + slice < audioFiles.length) {
            end = i + slice;
          } else {
            end = audioFiles.length;
          }

          pathList.add(
              audioFiles.sublist(i, end).map((file) => file.path).toList());
        }
        int loadedAudioFilesCounter = 0;
        for (var subPathList in pathList) {
          List<TrackMetadata> trackMetadataList =
              await _trackMetadataRepository.readTracksMetadata(subPathList);

          trackEntriesList.clear();
          pictureList.clear();
          for (var track in trackMetadataList) {
            trackEntriesList.add(TrackEntryModel(
              trackTitle: track.title,
              trackArtist: track.artist,
              album: track.album,
              trackDurationInMilliseconds: track.duration?.inMilliseconds,
              releaseYear: track.year,
              genreList: track.genres ?? [],
              directoryPath: directory.path,
              filePath: track.filePath,
              fileBaseName: basename(track.filePath),
              lyrics: track.lyrics,
              language: track.language,
              fileSize: track.fileSize,
              performers: track.performers.toString(),
              sampleRate: track.sampleRate,
              trackTotal: track.trackTotal,
              trackNumber: track.trackNumber,
              discTotal: track.totalDisc,
              discNumber: track.discNumber,
            ));

            if (track.pictures != null && track.pictures!.isNotEmpty) {
              for (var picture in track.pictures!) {
                pictureList.add(PictureModel(
                  trackPath: track.filePath,
                  bytes: picture.bytes,
                  mimeType: picture.mimetype,
                  pictureType: picture.pictureType,
                ));
              }
            }
          }
          _databaseRepository.addAudioTracksToDb(
              trackEntriesList: trackEntriesList);
          _databaseRepository.addPicturesToDb(pictureList);

          loadedAudioFilesCounter += subPathList.length;
          emit(AudioLoading(
            loadedDirectories: loadedDirectories,
            loadingDirectoryPath: directory.path,
            totalDirectories: directories.length,
            totalAudioFiles: audioFiles.length,
            loadedAudioFiles: loadedAudioFilesCounter,
          ));

          insertedTrackPathSet.addAll(subPathList);
        }
      } on MetadataParserException catch (e, s) {
        debugPrint("$e, $s");
      } on PathNotFoundException catch (e, s) {
        debugPrint("$e $s");
      } catch (e, s) {
        debugPrint("$e $s");
      }
      loadedDirectories.add(directory);
    }

    _allTracksStreamSubscription?.resume();

    return insertedTrackPathSet;
  }

  void update(List<Directory> directories) async {

    if (directories.isNotEmpty) {
      final existingPathsInDbSet = await _databaseRepository.getTracksFilePaths();
      final insertedTrackPathSet = await addAudioTracksToDb(directories: directories);

      if (insertedTrackPathSet.isEmpty || existingPathsInDbSet.isEmpty) {
        emit(AudioLoadComplete(audioList: [], exceptionFilePathList: []));
        return;
      }
      //find difference between existing and new added tracks
      Set<String> differenceSet = existingPathsInDbSet.difference(insertedTrackPathSet);
      //goal: delete tracks from the database that were deleted from folders
      _databaseRepository.deleteTrackByFilePaths(filePathList: differenceSet.toList());
    }


  }

  @override
  Future<void> close() {
    _allTracksStreamSubscription?.cancel();
    return super.close();
  }
}
