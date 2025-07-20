import 'package:drift/drift.dart' show Value;
import 'package:mate_player/data/sources/db.dart' show TracksCompanion;
import 'package:mate_player/data/sources/db_type_converters.dart';
import 'package:mate_player/domain/models/track_entry_model.dart';

extension TrackEntryMapper on TrackEntryModel {
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
