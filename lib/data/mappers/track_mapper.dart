import 'package:drift/drift.dart' show Value;
import 'package:mate_player/data/sources/db.dart';
import 'package:mate_player/data/sources/db_type_converters.dart';
import 'package:mate_player/domain/models/track_model.dart';

extension TrackMapper on Track {
  TrackModel toDomain() => TrackModel(
      id: id,
      trackTitle: trackTitle,
      trackArtist: trackArtist,
      trackDurationInMilliseconds: trackDurationInMilliseconds,
      sampleRate: sampleRate,
      language: language,
      lyrics: lyrics,
      performers: performers,
      album: album,
      discNumber: discNumber,
      discTotal: discTotal,
      trackNumber: trackNumber,
      trackTotal: trackTotal,
      genreList: genreList.genreList,
      releaseYear: releaseYear,
      directoryPath: directoryPath,
      filePath: filePath,
      fileBaseName: fileBaseName,
      fileSize: fileSize,
      createdTime: createdTime,
      playbackError: playbackError);
}

extension TracksCompanionInsertMapper on TrackModel {
  TracksCompanion toCompanion() => TracksCompanion.insert(
        trackTitle: Value(trackTitle),
        trackArtist: Value(trackArtist),
        album: Value(album),
        trackDurationInMilliseconds: Value(trackDurationInMilliseconds),
        releaseYear: Value(releaseYear),
        genreList: Genres(genreList),
        directoryPath: directoryPath,
        filePath: filePath,
        fileBaseName: fileBaseName,
        lyrics: Value(lyrics),
        language: Value(language),
        fileSize: Value(fileSize),
        performers: Value(performers.toString()),
        sampleRate: Value(sampleRate),
        trackTotal: Value(trackTotal),
        trackNumber: Value(trackNumber),
        discTotal: Value(discTotal),
        discNumber: Value(discNumber),
      );
}
