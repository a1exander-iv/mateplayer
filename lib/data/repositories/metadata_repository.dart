import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:flutter/material.dart';
import 'package:mate_player/data/models/models.dart';
import 'package:mate_player/data/sources/db.dart' show AppDatabase;
import 'package:worker_manager/worker_manager.dart';

class TrackMetadataRepository {
  TrackMetadataRepository({required this.database});
  final AppDatabase database;

  Future<List<TrackMetadata>> readTracksMetadata(
    List<String> pathList,
  ) async {
    Cancelable<Map<String, dynamic>> cancelableWorker =
        workerManager.execute<Map<String, dynamic>>(
      () async {
        List<String> metadataExceptionFilePathList = [];
        List<Map<String, dynamic>> audioMetadataList = [];
        for (var path in pathList) {
          File file = File(path);
          final fileSize = file.lengthSync();

          try {
            final AudioMetadata trackMetadata =
                readMetadata(file, getImage: true);

            audioMetadataList.add(
              TrackMetadata(
                      album: trackMetadata.album,
                      year: trackMetadata.year,
                      language: trackMetadata.language,
                      artist: trackMetadata.artist,
                      performers: trackMetadata.performers,
                      title: trackMetadata.title,
                      trackNumber: trackMetadata.trackNumber,
                      trackTotal: trackMetadata.trackTotal,
                      duration: trackMetadata.duration,
                      genres: trackMetadata.genres,
                      discNumber: trackMetadata.discNumber,
                      totalDisc: trackMetadata.totalDisc,
                      lyrics: trackMetadata.lyrics,
                      bitrate: trackMetadata.bitrate,
                      sampleRate: trackMetadata.sampleRate,
                      fileSize: fileSize,
                      pictures: trackMetadata.pictures
                          .map((picture) => PictureIsolateModel(picture.bytes,
                              picture.mimetype, picture.pictureType.toString()))
                          .toList(),
                      filePath: file.path)
                  .toJson(),
            );
          } on MetadataParserException catch (e, s) {
            debugPrint("$e, ${s.toString()}");
            metadataExceptionFilePathList.add(e.track.path);
            audioMetadataList.add(
              TrackMetadata(fileSize: fileSize, filePath: file.path).toJson(),
            );
          } on NoMetadataParserException catch (e, s) {
            debugPrint("$e, ${s.toString()}");
            metadataExceptionFilePathList.add(e.track.path);
            audioMetadataList.add(
              TrackMetadata(fileSize: fileSize, filePath: file.path).toJson(),
            );
          } catch (e, s) {
            debugPrint("$e, ${s.toString()}");
          }
        }
        final isolateMetadataModelJson = IsolateMetadataModel(
                exceptionFilePathList: metadataExceptionFilePathList,
                metadataList: audioMetadataList)
            .toJson();
        return isolateMetadataModelJson;
      },
      priority: WorkPriority.immediately,
    );

    var data = await cancelableWorker.future;
    IsolateMetadataModel isolateMetadataModel =
        IsolateMetadataModel.fromJson(data);

    return isolateMetadataModel.metadataList
        .map((element) => TrackMetadata.fromJson(element))
        .toList();
  }
}
