// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsolateMetadataModel _$IsolateMetadataModelFromJson(
        Map<String, dynamic> json) =>
    IsolateMetadataModel(
      exceptionFilePathList: (json['exceptionFilePathList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      metadataList: (json['metadataList'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$IsolateMetadataModelToJson(
        IsolateMetadataModel instance) =>
    <String, dynamic>{
      'exceptionFilePathList': instance.exceptionFilePathList,
      'metadataList': instance.metadataList,
    };

TrackMetadata _$TrackMetadataFromJson(Map<String, dynamic> json) =>
    TrackMetadata(
      filePath: json['filePath'] as String,
      fileSize: (json['fileSize'] as num?)?.toInt(),
      album: json['album'] as String?,
      artist: json['artist'] as String?,
      performers: (json['performers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bitrate: (json['bitrate'] as num?)?.toInt(),
      discNumber: (json['discNumber'] as num?)?.toInt(),
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: (json['duration'] as num).toInt()),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      language: json['language'] as String?,
      lyrics: json['lyrics'] as String?,
      pictures: const PictureIsolateModelListConverter()
          .fromJson(json['pictures'] as List?),
      sampleRate: (json['sampleRate'] as num?)?.toInt(),
      title: json['title'] as String?,
      totalDisc: (json['totalDisc'] as num?)?.toInt(),
      trackNumber: (json['trackNumber'] as num?)?.toInt(),
      trackTotal: (json['trackTotal'] as num?)?.toInt(),
      year:
          json['year'] == null ? null : DateTime.parse(json['year'] as String),
    );

Map<String, dynamic> _$TrackMetadataToJson(TrackMetadata instance) =>
    <String, dynamic>{
      'album': instance.album,
      'year': instance.year?.toIso8601String(),
      'language': instance.language,
      'artist': instance.artist,
      'performers': instance.performers,
      'title': instance.title,
      'trackNumber': instance.trackNumber,
      'trackTotal': instance.trackTotal,
      'duration': instance.duration?.inMicroseconds,
      'genres': instance.genres,
      'discNumber': instance.discNumber,
      'totalDisc': instance.totalDisc,
      'lyrics': instance.lyrics,
      'bitrate': instance.bitrate,
      'sampleRate': instance.sampleRate,
      'pictures':
          const PictureIsolateModelListConverter().toJson(instance.pictures),
      'fileSize': instance.fileSize,
      'filePath': instance.filePath,
    };

PictureIsolateModel _$PictureIsolateModelFromJson(Map<String, dynamic> json) =>
    PictureIsolateModel(
      const Uint8ListConverter().fromJson(json['bytes'] as List<int>?),
      json['mimetype'] as String,
      json['pictureType'] as String,
    );

Map<String, dynamic> _$PictureIsolateModelToJson(
        PictureIsolateModel instance) =>
    <String, dynamic>{
      'bytes': const Uint8ListConverter().toJson(instance.bytes),
      'mimetype': instance.mimetype,
      'pictureType': instance.pictureType,
    };
