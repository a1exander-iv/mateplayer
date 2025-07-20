
class TrackEntryModel {
  final String? trackTitle;
  final String? trackArtist;
  final int? trackDurationInMilliseconds;
  final int? sampleRate;
  final String? language;
  final String? lyrics;
  final String? performers;
  final String? album;
  final int? discNumber;
  final int? discTotal;
  final int? trackNumber;
  final int? trackTotal;
  final List<String> genreList;
  final DateTime? releaseYear;
  final String directoryPath;
  final String filePath;
  final String fileBaseName;
  final int? fileSize;

  TrackEntryModel({
    this.trackTitle,
    this.trackArtist,
    this.trackDurationInMilliseconds,
    this.sampleRate,
    this.language,
    this.lyrics,
    this.performers,
    this.album,
    this.discNumber,
    this.discTotal,
    this.trackNumber,
    this.trackTotal,
    required this.genreList,
    this.releaseYear,
    required this.directoryPath,
    required this.filePath,
    required this.fileBaseName,
    this.fileSize,
  });
}
