import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

part "models.g.dart";


@JsonSerializable()
class IsolateMetadataModel {
  List<String> exceptionFilePathList;

  List<Map<String, dynamic>> metadataList;

  IsolateMetadataModel({required this.exceptionFilePathList, required this.metadataList});

  factory IsolateMetadataModel.fromJson(Map<String, dynamic> json) => _$IsolateMetadataModelFromJson(json);

  Map<String, dynamic> toJson() => _$IsolateMetadataModelToJson(this);

}

@JsonSerializable()
class TrackMetadata {
  String? album;
  DateTime? year;
  String? language;
  String? artist;
  List<String>? performers;
  String? title;
  int? trackNumber;
  int? trackTotal;
  Duration? duration;
  List<String>? genres;
  int? discNumber;
  int? totalDisc;
  String? lyrics;
  int? bitrate;
  int? sampleRate;
  @PictureIsolateModelListConverter()
  List<PictureIsolateModel>? pictures;
  int? fileSize;
  String filePath;
  TrackMetadata({
    required this.filePath, 
    this.fileSize,
    this.album, 
    this.artist, 
    this.performers,
    this.bitrate, 
    this.discNumber, 
    this.duration,
    this.genres,
    this.language,
    this.lyrics,
    this.pictures,
    this.sampleRate,
    this.title,
    this.totalDisc,this.trackNumber, this.trackTotal,this.year});

  factory TrackMetadata.fromJson(Map<String, dynamic> json) => _$TrackMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$TrackMetadataToJson(this);

}

@JsonSerializable()
class PictureIsolateModel {

  @Uint8ListConverter()
  Uint8List? bytes;
  String mimetype;
  String pictureType;

  PictureIsolateModel(this.bytes, this.mimetype, this.pictureType);

  factory PictureIsolateModel.fromJson(Map<String, dynamic> json) => _$PictureIsolateModelFromJson(json);

  Map<String, dynamic> toJson() => _$PictureIsolateModelToJson(this);
}



class Uint8ListConverter implements JsonConverter<Uint8List?, List<int>?> {
  const Uint8ListConverter();

  
  @override
  Uint8List? fromJson(List<int>? json) {
    if (json == null) return null;

    return Uint8List.fromList(json);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    if (object == null) return null;

    return object.toList();
  }
}

class PictureIsolateModelListConverter implements JsonConverter<List<PictureIsolateModel>?, List<dynamic>?> {
  const PictureIsolateModelListConverter();

  @override
  List<PictureIsolateModel>? fromJson(List<dynamic>? json) {
    if (json == null) return null;
    return json.map((item) => PictureIsolateModel.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  List<Map<String, dynamic>>? toJson(List<PictureIsolateModel>? pictures) {
    if (pictures == null) return null;
    return pictures.map((pic) => pic.toJson()).toList();
  }
}
