import 'dart:async';
import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:crypto/crypto.dart' show md5;
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
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

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
  }

  void loadNewDirectory(String directoryPath) async {
    final Set<String> insertedTrackPathSet = await addAudioTracksToDb(directories: [Directory(directoryPath)]);
    if (insertedTrackPathSet.isEmpty) {
      _loadAudioTracksFromDatabase();
    }
  }

  void _loadAudioTracksFromDatabase() async {
    List<TrackModel> trackList =  await _databaseRepository.readAllTracksFromDb;
    emit(AudioLoadComplete(audioList: trackList, exceptionFilePathList: _exceptionFilePathList));

    _allTracksStreamSubscription?.cancel();
    _allTracksStreamSubscription = _databaseRepository
        .trackListStreamController.stream
        .listen((trackList) {
      emit(AudioLoadComplete(
        audioList: trackList,
        exceptionFilePathList: _exceptionFilePathList,
      ));
    });
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
              fileBaseName: path.basename(track.filePath),
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
                if (picture.bytes != null) {
                final (trackImagePath, imageHash) = await _saveImageToSubfolders(picture.bytes!);
                pictureList.add(PictureModel(
                  trackPath: track.filePath,
                  imageHash: imageHash,
                  imagePath: trackImagePath,
                  mimeType: picture.mimetype,
                  pictureType: picture.pictureType,
                ));
                }
                
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

  Future<(String, String)> _saveImageToSubfolders(Uint8List bytes) async {

    final md5HashImage = md5.convert(bytes).toString();

    final subDir1 = md5HashImage.substring(0, 2);
    final subDir2 = md5HashImage.substring(2, 4);

    final baseDir = await getApplicationDocumentsDirectory();

    final dirPath = path.join(baseDir.path, "track_images", subDir1, subDir2);
    final filePath = path.join(dirPath, "$md5HashImage.png");

    final directory = Directory(dirPath) ;
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    final imageFile = File(filePath);
    if (!await imageFile.exists()) {
      await imageFile.writeAsBytes(bytes);
    }
    return (imageFile.path, md5HashImage);
  }

  @override
  Future<void> close() {
    _allTracksStreamSubscription?.cancel();
    return super.close();
  }
}
