// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_type_converters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genres _$GenresFromJson(Map<String, dynamic> json) => Genres(
  (json['genreList'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
  'genreList': instance.genreList,
};

TrackIds _$TrackIdsFromJson(Map<String, dynamic> json) => TrackIds(
  (json['trackIdsList'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$TrackIdsToJson(TrackIds instance) => <String, dynamic>{
  'trackIdsList': instance.trackIdsList,
};
