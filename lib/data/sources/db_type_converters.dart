import "dart:convert";

import "package:drift/drift.dart";
import "package:json_annotation/json_annotation.dart";

part "db_type_converters.g.dart";

@JsonSerializable()
class Genres {
  List<String> genreList;

  Genres(this.genreList);

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

class GenreConverter extends TypeConverter<Genres, String>
    with JsonTypeConverter2<Genres, String, Map<String, Object?>> {
  const GenreConverter();

  @override
  Genres fromSql(String fromDb) {
    return fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Genres value) {
    return json.encode(toJson(value));
  }

  @override
  Genres fromJson(Map<String, Object?> json) {
    return Genres.fromJson(json);
  }

  @override
  Map<String, Object?> toJson(Genres value) {
    return value.toJson();
  }
}

@JsonSerializable()
class TrackIds {
  final List<int> trackIdsList;

  const TrackIds(this.trackIdsList);

  factory TrackIds.fromJson(Map<String, dynamic> json) =>
      _$TrackIdsFromJson(json);
  Map<String, dynamic> toJson() => _$TrackIdsToJson(this);
}

class TrackIdsConverter extends TypeConverter<TrackIds, String>
    with JsonTypeConverter2<TrackIds, String, Map<String, Object?>> {
  const TrackIdsConverter();

  @override
  TrackIds fromSql(String fromDb) {
    return fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(TrackIds value) {
    return json.encode(toJson(value));
  }

  @override
  TrackIds fromJson(Map<String, Object?> json) {
    return TrackIds.fromJson(json);
  }

  @override
  Map<String, Object?> toJson(TrackIds value) {
    return value.toJson();
  }
}
