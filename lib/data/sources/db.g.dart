// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $TracksTable extends Tracks with TableInfo<$TracksTable, Track> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TracksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _trackTitleMeta = const VerificationMeta(
    'trackTitle',
  );
  @override
  late final GeneratedColumn<String> trackTitle = GeneratedColumn<String>(
    'track_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trackArtistMeta = const VerificationMeta(
    'trackArtist',
  );
  @override
  late final GeneratedColumn<String> trackArtist = GeneratedColumn<String>(
    'track_artist',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trackDurationInMillisecondsMeta =
      const VerificationMeta('trackDurationInMilliseconds');
  @override
  late final GeneratedColumn<int> trackDurationInMilliseconds =
      GeneratedColumn<int>(
        'track_duration_in_milliseconds',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _sampleRateMeta = const VerificationMeta(
    'sampleRate',
  );
  @override
  late final GeneratedColumn<int> sampleRate = GeneratedColumn<int>(
    'sample_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lyricsMeta = const VerificationMeta('lyrics');
  @override
  late final GeneratedColumn<String> lyrics = GeneratedColumn<String>(
    'lyrics',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _performersMeta = const VerificationMeta(
    'performers',
  );
  @override
  late final GeneratedColumn<String> performers = GeneratedColumn<String>(
    'performers',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _albumMeta = const VerificationMeta('album');
  @override
  late final GeneratedColumn<String> album = GeneratedColumn<String>(
    'album',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discNumberMeta = const VerificationMeta(
    'discNumber',
  );
  @override
  late final GeneratedColumn<int> discNumber = GeneratedColumn<int>(
    'disc_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discTotalMeta = const VerificationMeta(
    'discTotal',
  );
  @override
  late final GeneratedColumn<int> discTotal = GeneratedColumn<int>(
    'disc_total',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trackNumberMeta = const VerificationMeta(
    'trackNumber',
  );
  @override
  late final GeneratedColumn<int> trackNumber = GeneratedColumn<int>(
    'track_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trackTotalMeta = const VerificationMeta(
    'trackTotal',
  );
  @override
  late final GeneratedColumn<int> trackTotal = GeneratedColumn<int>(
    'track_total',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Genres, String> genreList =
      GeneratedColumn<String>(
        'genre_list',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Genres>($TracksTable.$convertergenreList);
  static const VerificationMeta _releaseYearMeta = const VerificationMeta(
    'releaseYear',
  );
  @override
  late final GeneratedColumn<DateTime> releaseYear = GeneratedColumn<DateTime>(
    'release_year',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _directoryPathMeta = const VerificationMeta(
    'directoryPath',
  );
  @override
  late final GeneratedColumn<String> directoryPath = GeneratedColumn<String>(
    'directory_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _fileBaseNameMeta = const VerificationMeta(
    'fileBaseName',
  );
  @override
  late final GeneratedColumn<String> fileBaseName = GeneratedColumn<String>(
    'file_base_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileSizeMeta = const VerificationMeta(
    'fileSize',
  );
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
    'file_size',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _playbackErrorMeta = const VerificationMeta(
    'playbackError',
  );
  @override
  late final GeneratedColumn<bool> playbackError = GeneratedColumn<bool>(
    'playback_error',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("playback_error" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    trackTitle,
    trackArtist,
    trackDurationInMilliseconds,
    sampleRate,
    language,
    lyrics,
    performers,
    album,
    discNumber,
    discTotal,
    trackNumber,
    trackTotal,
    genreList,
    releaseYear,
    directoryPath,
    filePath,
    fileBaseName,
    fileSize,
    createdTime,
    playbackError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tracks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Track> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('track_title')) {
      context.handle(
        _trackTitleMeta,
        trackTitle.isAcceptableOrUnknown(data['track_title']!, _trackTitleMeta),
      );
    }
    if (data.containsKey('track_artist')) {
      context.handle(
        _trackArtistMeta,
        trackArtist.isAcceptableOrUnknown(
          data['track_artist']!,
          _trackArtistMeta,
        ),
      );
    }
    if (data.containsKey('track_duration_in_milliseconds')) {
      context.handle(
        _trackDurationInMillisecondsMeta,
        trackDurationInMilliseconds.isAcceptableOrUnknown(
          data['track_duration_in_milliseconds']!,
          _trackDurationInMillisecondsMeta,
        ),
      );
    }
    if (data.containsKey('sample_rate')) {
      context.handle(
        _sampleRateMeta,
        sampleRate.isAcceptableOrUnknown(data['sample_rate']!, _sampleRateMeta),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('lyrics')) {
      context.handle(
        _lyricsMeta,
        lyrics.isAcceptableOrUnknown(data['lyrics']!, _lyricsMeta),
      );
    }
    if (data.containsKey('performers')) {
      context.handle(
        _performersMeta,
        performers.isAcceptableOrUnknown(data['performers']!, _performersMeta),
      );
    }
    if (data.containsKey('album')) {
      context.handle(
        _albumMeta,
        album.isAcceptableOrUnknown(data['album']!, _albumMeta),
      );
    }
    if (data.containsKey('disc_number')) {
      context.handle(
        _discNumberMeta,
        discNumber.isAcceptableOrUnknown(data['disc_number']!, _discNumberMeta),
      );
    }
    if (data.containsKey('disc_total')) {
      context.handle(
        _discTotalMeta,
        discTotal.isAcceptableOrUnknown(data['disc_total']!, _discTotalMeta),
      );
    }
    if (data.containsKey('track_number')) {
      context.handle(
        _trackNumberMeta,
        trackNumber.isAcceptableOrUnknown(
          data['track_number']!,
          _trackNumberMeta,
        ),
      );
    }
    if (data.containsKey('track_total')) {
      context.handle(
        _trackTotalMeta,
        trackTotal.isAcceptableOrUnknown(data['track_total']!, _trackTotalMeta),
      );
    }
    if (data.containsKey('release_year')) {
      context.handle(
        _releaseYearMeta,
        releaseYear.isAcceptableOrUnknown(
          data['release_year']!,
          _releaseYearMeta,
        ),
      );
    }
    if (data.containsKey('directory_path')) {
      context.handle(
        _directoryPathMeta,
        directoryPath.isAcceptableOrUnknown(
          data['directory_path']!,
          _directoryPathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_directoryPathMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_base_name')) {
      context.handle(
        _fileBaseNameMeta,
        fileBaseName.isAcceptableOrUnknown(
          data['file_base_name']!,
          _fileBaseNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fileBaseNameMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(
        _fileSizeMeta,
        fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    if (data.containsKey('playback_error')) {
      context.handle(
        _playbackErrorMeta,
        playbackError.isAcceptableOrUnknown(
          data['playback_error']!,
          _playbackErrorMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Track map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Track(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      trackTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_title'],
      ),
      trackArtist: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_artist'],
      ),
      trackDurationInMilliseconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}track_duration_in_milliseconds'],
      ),
      sampleRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sample_rate'],
      ),
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      ),
      lyrics: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lyrics'],
      ),
      performers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}performers'],
      ),
      album: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}album'],
      ),
      discNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}disc_number'],
      ),
      discTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}disc_total'],
      ),
      trackNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}track_number'],
      ),
      trackTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}track_total'],
      ),
      genreList: $TracksTable.$convertergenreList.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}genre_list'],
        )!,
      ),
      releaseYear: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}release_year'],
      ),
      directoryPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}directory_path'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      fileBaseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_base_name'],
      )!,
      fileSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size'],
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
      playbackError: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}playback_error'],
      )!,
    );
  }

  @override
  $TracksTable createAlias(String alias) {
    return $TracksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Genres, String, Map<String, Object?>>
  $convertergenreList = const GenreConverter();
}

class Track extends DataClass implements Insertable<Track> {
  final int id;
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
  final Genres genreList;
  final DateTime? releaseYear;
  final String directoryPath;
  final String filePath;
  final String fileBaseName;
  final int? fileSize;
  final DateTime createdTime;
  final bool playbackError;
  const Track({
    required this.id,
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
    required this.createdTime,
    required this.playbackError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || trackTitle != null) {
      map['track_title'] = Variable<String>(trackTitle);
    }
    if (!nullToAbsent || trackArtist != null) {
      map['track_artist'] = Variable<String>(trackArtist);
    }
    if (!nullToAbsent || trackDurationInMilliseconds != null) {
      map['track_duration_in_milliseconds'] = Variable<int>(
        trackDurationInMilliseconds,
      );
    }
    if (!nullToAbsent || sampleRate != null) {
      map['sample_rate'] = Variable<int>(sampleRate);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || lyrics != null) {
      map['lyrics'] = Variable<String>(lyrics);
    }
    if (!nullToAbsent || performers != null) {
      map['performers'] = Variable<String>(performers);
    }
    if (!nullToAbsent || album != null) {
      map['album'] = Variable<String>(album);
    }
    if (!nullToAbsent || discNumber != null) {
      map['disc_number'] = Variable<int>(discNumber);
    }
    if (!nullToAbsent || discTotal != null) {
      map['disc_total'] = Variable<int>(discTotal);
    }
    if (!nullToAbsent || trackNumber != null) {
      map['track_number'] = Variable<int>(trackNumber);
    }
    if (!nullToAbsent || trackTotal != null) {
      map['track_total'] = Variable<int>(trackTotal);
    }
    {
      map['genre_list'] = Variable<String>(
        $TracksTable.$convertergenreList.toSql(genreList),
      );
    }
    if (!nullToAbsent || releaseYear != null) {
      map['release_year'] = Variable<DateTime>(releaseYear);
    }
    map['directory_path'] = Variable<String>(directoryPath);
    map['file_path'] = Variable<String>(filePath);
    map['file_base_name'] = Variable<String>(fileBaseName);
    if (!nullToAbsent || fileSize != null) {
      map['file_size'] = Variable<int>(fileSize);
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    map['playback_error'] = Variable<bool>(playbackError);
    return map;
  }

  TracksCompanion toCompanion(bool nullToAbsent) {
    return TracksCompanion(
      id: Value(id),
      trackTitle: trackTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(trackTitle),
      trackArtist: trackArtist == null && nullToAbsent
          ? const Value.absent()
          : Value(trackArtist),
      trackDurationInMilliseconds:
          trackDurationInMilliseconds == null && nullToAbsent
          ? const Value.absent()
          : Value(trackDurationInMilliseconds),
      sampleRate: sampleRate == null && nullToAbsent
          ? const Value.absent()
          : Value(sampleRate),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      lyrics: lyrics == null && nullToAbsent
          ? const Value.absent()
          : Value(lyrics),
      performers: performers == null && nullToAbsent
          ? const Value.absent()
          : Value(performers),
      album: album == null && nullToAbsent
          ? const Value.absent()
          : Value(album),
      discNumber: discNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(discNumber),
      discTotal: discTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(discTotal),
      trackNumber: trackNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(trackNumber),
      trackTotal: trackTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(trackTotal),
      genreList: Value(genreList),
      releaseYear: releaseYear == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseYear),
      directoryPath: Value(directoryPath),
      filePath: Value(filePath),
      fileBaseName: Value(fileBaseName),
      fileSize: fileSize == null && nullToAbsent
          ? const Value.absent()
          : Value(fileSize),
      createdTime: Value(createdTime),
      playbackError: Value(playbackError),
    );
  }

  factory Track.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Track(
      id: serializer.fromJson<int>(json['id']),
      trackTitle: serializer.fromJson<String?>(json['trackTitle']),
      trackArtist: serializer.fromJson<String?>(json['trackArtist']),
      trackDurationInMilliseconds: serializer.fromJson<int?>(
        json['trackDurationInMilliseconds'],
      ),
      sampleRate: serializer.fromJson<int?>(json['sampleRate']),
      language: serializer.fromJson<String?>(json['language']),
      lyrics: serializer.fromJson<String?>(json['lyrics']),
      performers: serializer.fromJson<String?>(json['performers']),
      album: serializer.fromJson<String?>(json['album']),
      discNumber: serializer.fromJson<int?>(json['discNumber']),
      discTotal: serializer.fromJson<int?>(json['discTotal']),
      trackNumber: serializer.fromJson<int?>(json['trackNumber']),
      trackTotal: serializer.fromJson<int?>(json['trackTotal']),
      genreList: $TracksTable.$convertergenreList.fromJson(
        serializer.fromJson<Map<String, Object?>>(json['genreList']),
      ),
      releaseYear: serializer.fromJson<DateTime?>(json['releaseYear']),
      directoryPath: serializer.fromJson<String>(json['directoryPath']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileBaseName: serializer.fromJson<String>(json['fileBaseName']),
      fileSize: serializer.fromJson<int?>(json['fileSize']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      playbackError: serializer.fromJson<bool>(json['playbackError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trackTitle': serializer.toJson<String?>(trackTitle),
      'trackArtist': serializer.toJson<String?>(trackArtist),
      'trackDurationInMilliseconds': serializer.toJson<int?>(
        trackDurationInMilliseconds,
      ),
      'sampleRate': serializer.toJson<int?>(sampleRate),
      'language': serializer.toJson<String?>(language),
      'lyrics': serializer.toJson<String?>(lyrics),
      'performers': serializer.toJson<String?>(performers),
      'album': serializer.toJson<String?>(album),
      'discNumber': serializer.toJson<int?>(discNumber),
      'discTotal': serializer.toJson<int?>(discTotal),
      'trackNumber': serializer.toJson<int?>(trackNumber),
      'trackTotal': serializer.toJson<int?>(trackTotal),
      'genreList': serializer.toJson<Map<String, Object?>>(
        $TracksTable.$convertergenreList.toJson(genreList),
      ),
      'releaseYear': serializer.toJson<DateTime?>(releaseYear),
      'directoryPath': serializer.toJson<String>(directoryPath),
      'filePath': serializer.toJson<String>(filePath),
      'fileBaseName': serializer.toJson<String>(fileBaseName),
      'fileSize': serializer.toJson<int?>(fileSize),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'playbackError': serializer.toJson<bool>(playbackError),
    };
  }

  Track copyWith({
    int? id,
    Value<String?> trackTitle = const Value.absent(),
    Value<String?> trackArtist = const Value.absent(),
    Value<int?> trackDurationInMilliseconds = const Value.absent(),
    Value<int?> sampleRate = const Value.absent(),
    Value<String?> language = const Value.absent(),
    Value<String?> lyrics = const Value.absent(),
    Value<String?> performers = const Value.absent(),
    Value<String?> album = const Value.absent(),
    Value<int?> discNumber = const Value.absent(),
    Value<int?> discTotal = const Value.absent(),
    Value<int?> trackNumber = const Value.absent(),
    Value<int?> trackTotal = const Value.absent(),
    Genres? genreList,
    Value<DateTime?> releaseYear = const Value.absent(),
    String? directoryPath,
    String? filePath,
    String? fileBaseName,
    Value<int?> fileSize = const Value.absent(),
    DateTime? createdTime,
    bool? playbackError,
  }) => Track(
    id: id ?? this.id,
    trackTitle: trackTitle.present ? trackTitle.value : this.trackTitle,
    trackArtist: trackArtist.present ? trackArtist.value : this.trackArtist,
    trackDurationInMilliseconds: trackDurationInMilliseconds.present
        ? trackDurationInMilliseconds.value
        : this.trackDurationInMilliseconds,
    sampleRate: sampleRate.present ? sampleRate.value : this.sampleRate,
    language: language.present ? language.value : this.language,
    lyrics: lyrics.present ? lyrics.value : this.lyrics,
    performers: performers.present ? performers.value : this.performers,
    album: album.present ? album.value : this.album,
    discNumber: discNumber.present ? discNumber.value : this.discNumber,
    discTotal: discTotal.present ? discTotal.value : this.discTotal,
    trackNumber: trackNumber.present ? trackNumber.value : this.trackNumber,
    trackTotal: trackTotal.present ? trackTotal.value : this.trackTotal,
    genreList: genreList ?? this.genreList,
    releaseYear: releaseYear.present ? releaseYear.value : this.releaseYear,
    directoryPath: directoryPath ?? this.directoryPath,
    filePath: filePath ?? this.filePath,
    fileBaseName: fileBaseName ?? this.fileBaseName,
    fileSize: fileSize.present ? fileSize.value : this.fileSize,
    createdTime: createdTime ?? this.createdTime,
    playbackError: playbackError ?? this.playbackError,
  );
  Track copyWithCompanion(TracksCompanion data) {
    return Track(
      id: data.id.present ? data.id.value : this.id,
      trackTitle: data.trackTitle.present
          ? data.trackTitle.value
          : this.trackTitle,
      trackArtist: data.trackArtist.present
          ? data.trackArtist.value
          : this.trackArtist,
      trackDurationInMilliseconds: data.trackDurationInMilliseconds.present
          ? data.trackDurationInMilliseconds.value
          : this.trackDurationInMilliseconds,
      sampleRate: data.sampleRate.present
          ? data.sampleRate.value
          : this.sampleRate,
      language: data.language.present ? data.language.value : this.language,
      lyrics: data.lyrics.present ? data.lyrics.value : this.lyrics,
      performers: data.performers.present
          ? data.performers.value
          : this.performers,
      album: data.album.present ? data.album.value : this.album,
      discNumber: data.discNumber.present
          ? data.discNumber.value
          : this.discNumber,
      discTotal: data.discTotal.present ? data.discTotal.value : this.discTotal,
      trackNumber: data.trackNumber.present
          ? data.trackNumber.value
          : this.trackNumber,
      trackTotal: data.trackTotal.present
          ? data.trackTotal.value
          : this.trackTotal,
      genreList: data.genreList.present ? data.genreList.value : this.genreList,
      releaseYear: data.releaseYear.present
          ? data.releaseYear.value
          : this.releaseYear,
      directoryPath: data.directoryPath.present
          ? data.directoryPath.value
          : this.directoryPath,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileBaseName: data.fileBaseName.present
          ? data.fileBaseName.value
          : this.fileBaseName,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
      playbackError: data.playbackError.present
          ? data.playbackError.value
          : this.playbackError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Track(')
          ..write('id: $id, ')
          ..write('trackTitle: $trackTitle, ')
          ..write('trackArtist: $trackArtist, ')
          ..write('trackDurationInMilliseconds: $trackDurationInMilliseconds, ')
          ..write('sampleRate: $sampleRate, ')
          ..write('language: $language, ')
          ..write('lyrics: $lyrics, ')
          ..write('performers: $performers, ')
          ..write('album: $album, ')
          ..write('discNumber: $discNumber, ')
          ..write('discTotal: $discTotal, ')
          ..write('trackNumber: $trackNumber, ')
          ..write('trackTotal: $trackTotal, ')
          ..write('genreList: $genreList, ')
          ..write('releaseYear: $releaseYear, ')
          ..write('directoryPath: $directoryPath, ')
          ..write('filePath: $filePath, ')
          ..write('fileBaseName: $fileBaseName, ')
          ..write('fileSize: $fileSize, ')
          ..write('createdTime: $createdTime, ')
          ..write('playbackError: $playbackError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    trackTitle,
    trackArtist,
    trackDurationInMilliseconds,
    sampleRate,
    language,
    lyrics,
    performers,
    album,
    discNumber,
    discTotal,
    trackNumber,
    trackTotal,
    genreList,
    releaseYear,
    directoryPath,
    filePath,
    fileBaseName,
    fileSize,
    createdTime,
    playbackError,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Track &&
          other.id == this.id &&
          other.trackTitle == this.trackTitle &&
          other.trackArtist == this.trackArtist &&
          other.trackDurationInMilliseconds ==
              this.trackDurationInMilliseconds &&
          other.sampleRate == this.sampleRate &&
          other.language == this.language &&
          other.lyrics == this.lyrics &&
          other.performers == this.performers &&
          other.album == this.album &&
          other.discNumber == this.discNumber &&
          other.discTotal == this.discTotal &&
          other.trackNumber == this.trackNumber &&
          other.trackTotal == this.trackTotal &&
          other.genreList == this.genreList &&
          other.releaseYear == this.releaseYear &&
          other.directoryPath == this.directoryPath &&
          other.filePath == this.filePath &&
          other.fileBaseName == this.fileBaseName &&
          other.fileSize == this.fileSize &&
          other.createdTime == this.createdTime &&
          other.playbackError == this.playbackError);
}

class TracksCompanion extends UpdateCompanion<Track> {
  final Value<int> id;
  final Value<String?> trackTitle;
  final Value<String?> trackArtist;
  final Value<int?> trackDurationInMilliseconds;
  final Value<int?> sampleRate;
  final Value<String?> language;
  final Value<String?> lyrics;
  final Value<String?> performers;
  final Value<String?> album;
  final Value<int?> discNumber;
  final Value<int?> discTotal;
  final Value<int?> trackNumber;
  final Value<int?> trackTotal;
  final Value<Genres> genreList;
  final Value<DateTime?> releaseYear;
  final Value<String> directoryPath;
  final Value<String> filePath;
  final Value<String> fileBaseName;
  final Value<int?> fileSize;
  final Value<DateTime> createdTime;
  final Value<bool> playbackError;
  const TracksCompanion({
    this.id = const Value.absent(),
    this.trackTitle = const Value.absent(),
    this.trackArtist = const Value.absent(),
    this.trackDurationInMilliseconds = const Value.absent(),
    this.sampleRate = const Value.absent(),
    this.language = const Value.absent(),
    this.lyrics = const Value.absent(),
    this.performers = const Value.absent(),
    this.album = const Value.absent(),
    this.discNumber = const Value.absent(),
    this.discTotal = const Value.absent(),
    this.trackNumber = const Value.absent(),
    this.trackTotal = const Value.absent(),
    this.genreList = const Value.absent(),
    this.releaseYear = const Value.absent(),
    this.directoryPath = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileBaseName = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.playbackError = const Value.absent(),
  });
  TracksCompanion.insert({
    this.id = const Value.absent(),
    this.trackTitle = const Value.absent(),
    this.trackArtist = const Value.absent(),
    this.trackDurationInMilliseconds = const Value.absent(),
    this.sampleRate = const Value.absent(),
    this.language = const Value.absent(),
    this.lyrics = const Value.absent(),
    this.performers = const Value.absent(),
    this.album = const Value.absent(),
    this.discNumber = const Value.absent(),
    this.discTotal = const Value.absent(),
    this.trackNumber = const Value.absent(),
    this.trackTotal = const Value.absent(),
    required Genres genreList,
    this.releaseYear = const Value.absent(),
    required String directoryPath,
    required String filePath,
    required String fileBaseName,
    this.fileSize = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.playbackError = const Value.absent(),
  }) : genreList = Value(genreList),
       directoryPath = Value(directoryPath),
       filePath = Value(filePath),
       fileBaseName = Value(fileBaseName);
  static Insertable<Track> custom({
    Expression<int>? id,
    Expression<String>? trackTitle,
    Expression<String>? trackArtist,
    Expression<int>? trackDurationInMilliseconds,
    Expression<int>? sampleRate,
    Expression<String>? language,
    Expression<String>? lyrics,
    Expression<String>? performers,
    Expression<String>? album,
    Expression<int>? discNumber,
    Expression<int>? discTotal,
    Expression<int>? trackNumber,
    Expression<int>? trackTotal,
    Expression<String>? genreList,
    Expression<DateTime>? releaseYear,
    Expression<String>? directoryPath,
    Expression<String>? filePath,
    Expression<String>? fileBaseName,
    Expression<int>? fileSize,
    Expression<DateTime>? createdTime,
    Expression<bool>? playbackError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trackTitle != null) 'track_title': trackTitle,
      if (trackArtist != null) 'track_artist': trackArtist,
      if (trackDurationInMilliseconds != null)
        'track_duration_in_milliseconds': trackDurationInMilliseconds,
      if (sampleRate != null) 'sample_rate': sampleRate,
      if (language != null) 'language': language,
      if (lyrics != null) 'lyrics': lyrics,
      if (performers != null) 'performers': performers,
      if (album != null) 'album': album,
      if (discNumber != null) 'disc_number': discNumber,
      if (discTotal != null) 'disc_total': discTotal,
      if (trackNumber != null) 'track_number': trackNumber,
      if (trackTotal != null) 'track_total': trackTotal,
      if (genreList != null) 'genre_list': genreList,
      if (releaseYear != null) 'release_year': releaseYear,
      if (directoryPath != null) 'directory_path': directoryPath,
      if (filePath != null) 'file_path': filePath,
      if (fileBaseName != null) 'file_base_name': fileBaseName,
      if (fileSize != null) 'file_size': fileSize,
      if (createdTime != null) 'created_time': createdTime,
      if (playbackError != null) 'playback_error': playbackError,
    });
  }

  TracksCompanion copyWith({
    Value<int>? id,
    Value<String?>? trackTitle,
    Value<String?>? trackArtist,
    Value<int?>? trackDurationInMilliseconds,
    Value<int?>? sampleRate,
    Value<String?>? language,
    Value<String?>? lyrics,
    Value<String?>? performers,
    Value<String?>? album,
    Value<int?>? discNumber,
    Value<int?>? discTotal,
    Value<int?>? trackNumber,
    Value<int?>? trackTotal,
    Value<Genres>? genreList,
    Value<DateTime?>? releaseYear,
    Value<String>? directoryPath,
    Value<String>? filePath,
    Value<String>? fileBaseName,
    Value<int?>? fileSize,
    Value<DateTime>? createdTime,
    Value<bool>? playbackError,
  }) {
    return TracksCompanion(
      id: id ?? this.id,
      trackTitle: trackTitle ?? this.trackTitle,
      trackArtist: trackArtist ?? this.trackArtist,
      trackDurationInMilliseconds:
          trackDurationInMilliseconds ?? this.trackDurationInMilliseconds,
      sampleRate: sampleRate ?? this.sampleRate,
      language: language ?? this.language,
      lyrics: lyrics ?? this.lyrics,
      performers: performers ?? this.performers,
      album: album ?? this.album,
      discNumber: discNumber ?? this.discNumber,
      discTotal: discTotal ?? this.discTotal,
      trackNumber: trackNumber ?? this.trackNumber,
      trackTotal: trackTotal ?? this.trackTotal,
      genreList: genreList ?? this.genreList,
      releaseYear: releaseYear ?? this.releaseYear,
      directoryPath: directoryPath ?? this.directoryPath,
      filePath: filePath ?? this.filePath,
      fileBaseName: fileBaseName ?? this.fileBaseName,
      fileSize: fileSize ?? this.fileSize,
      createdTime: createdTime ?? this.createdTime,
      playbackError: playbackError ?? this.playbackError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trackTitle.present) {
      map['track_title'] = Variable<String>(trackTitle.value);
    }
    if (trackArtist.present) {
      map['track_artist'] = Variable<String>(trackArtist.value);
    }
    if (trackDurationInMilliseconds.present) {
      map['track_duration_in_milliseconds'] = Variable<int>(
        trackDurationInMilliseconds.value,
      );
    }
    if (sampleRate.present) {
      map['sample_rate'] = Variable<int>(sampleRate.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (lyrics.present) {
      map['lyrics'] = Variable<String>(lyrics.value);
    }
    if (performers.present) {
      map['performers'] = Variable<String>(performers.value);
    }
    if (album.present) {
      map['album'] = Variable<String>(album.value);
    }
    if (discNumber.present) {
      map['disc_number'] = Variable<int>(discNumber.value);
    }
    if (discTotal.present) {
      map['disc_total'] = Variable<int>(discTotal.value);
    }
    if (trackNumber.present) {
      map['track_number'] = Variable<int>(trackNumber.value);
    }
    if (trackTotal.present) {
      map['track_total'] = Variable<int>(trackTotal.value);
    }
    if (genreList.present) {
      map['genre_list'] = Variable<String>(
        $TracksTable.$convertergenreList.toSql(genreList.value),
      );
    }
    if (releaseYear.present) {
      map['release_year'] = Variable<DateTime>(releaseYear.value);
    }
    if (directoryPath.present) {
      map['directory_path'] = Variable<String>(directoryPath.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileBaseName.present) {
      map['file_base_name'] = Variable<String>(fileBaseName.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (playbackError.present) {
      map['playback_error'] = Variable<bool>(playbackError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TracksCompanion(')
          ..write('id: $id, ')
          ..write('trackTitle: $trackTitle, ')
          ..write('trackArtist: $trackArtist, ')
          ..write('trackDurationInMilliseconds: $trackDurationInMilliseconds, ')
          ..write('sampleRate: $sampleRate, ')
          ..write('language: $language, ')
          ..write('lyrics: $lyrics, ')
          ..write('performers: $performers, ')
          ..write('album: $album, ')
          ..write('discNumber: $discNumber, ')
          ..write('discTotal: $discTotal, ')
          ..write('trackNumber: $trackNumber, ')
          ..write('trackTotal: $trackTotal, ')
          ..write('genreList: $genreList, ')
          ..write('releaseYear: $releaseYear, ')
          ..write('directoryPath: $directoryPath, ')
          ..write('filePath: $filePath, ')
          ..write('fileBaseName: $fileBaseName, ')
          ..write('fileSize: $fileSize, ')
          ..write('createdTime: $createdTime, ')
          ..write('playbackError: $playbackError')
          ..write(')'))
        .toString();
  }
}

class $ListenedTrackTable extends ListenedTrack
    with TableInfo<$ListenedTrackTable, ListenedTrackData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ListenedTrackTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trackIdMeta = const VerificationMeta(
    'trackId',
  );
  @override
  late final GeneratedColumn<int> trackId = GeneratedColumn<int>(
    'track_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tracks (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _listenedTimeInSecondsMeta =
      const VerificationMeta('listenedTimeInSeconds');
  @override
  late final GeneratedColumn<int> listenedTimeInSeconds = GeneratedColumn<int>(
    'listened_time_in_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    trackId,
    listenedTimeInSeconds,
    createdTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'listened_track';
  @override
  VerificationContext validateIntegrity(
    Insertable<ListenedTrackData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('track_id')) {
      context.handle(
        _trackIdMeta,
        trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('listened_time_in_seconds')) {
      context.handle(
        _listenedTimeInSecondsMeta,
        listenedTimeInSeconds.isAcceptableOrUnknown(
          data['listened_time_in_seconds']!,
          _listenedTimeInSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_listenedTimeInSecondsMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ListenedTrackData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ListenedTrackData(
      trackId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}track_id'],
      )!,
      listenedTimeInSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}listened_time_in_seconds'],
      )!,
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
    );
  }

  @override
  $ListenedTrackTable createAlias(String alias) {
    return $ListenedTrackTable(attachedDatabase, alias);
  }
}

class ListenedTrackData extends DataClass
    implements Insertable<ListenedTrackData> {
  final int trackId;
  final int listenedTimeInSeconds;
  final DateTime createdTime;
  const ListenedTrackData({
    required this.trackId,
    required this.listenedTimeInSeconds,
    required this.createdTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['track_id'] = Variable<int>(trackId);
    map['listened_time_in_seconds'] = Variable<int>(listenedTimeInSeconds);
    map['created_time'] = Variable<DateTime>(createdTime);
    return map;
  }

  ListenedTrackCompanion toCompanion(bool nullToAbsent) {
    return ListenedTrackCompanion(
      trackId: Value(trackId),
      listenedTimeInSeconds: Value(listenedTimeInSeconds),
      createdTime: Value(createdTime),
    );
  }

  factory ListenedTrackData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ListenedTrackData(
      trackId: serializer.fromJson<int>(json['trackId']),
      listenedTimeInSeconds: serializer.fromJson<int>(
        json['listenedTimeInSeconds'],
      ),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trackId': serializer.toJson<int>(trackId),
      'listenedTimeInSeconds': serializer.toJson<int>(listenedTimeInSeconds),
      'createdTime': serializer.toJson<DateTime>(createdTime),
    };
  }

  ListenedTrackData copyWith({
    int? trackId,
    int? listenedTimeInSeconds,
    DateTime? createdTime,
  }) => ListenedTrackData(
    trackId: trackId ?? this.trackId,
    listenedTimeInSeconds: listenedTimeInSeconds ?? this.listenedTimeInSeconds,
    createdTime: createdTime ?? this.createdTime,
  );
  ListenedTrackData copyWithCompanion(ListenedTrackCompanion data) {
    return ListenedTrackData(
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      listenedTimeInSeconds: data.listenedTimeInSeconds.present
          ? data.listenedTimeInSeconds.value
          : this.listenedTimeInSeconds,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ListenedTrackData(')
          ..write('trackId: $trackId, ')
          ..write('listenedTimeInSeconds: $listenedTimeInSeconds, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(trackId, listenedTimeInSeconds, createdTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListenedTrackData &&
          other.trackId == this.trackId &&
          other.listenedTimeInSeconds == this.listenedTimeInSeconds &&
          other.createdTime == this.createdTime);
}

class ListenedTrackCompanion extends UpdateCompanion<ListenedTrackData> {
  final Value<int> trackId;
  final Value<int> listenedTimeInSeconds;
  final Value<DateTime> createdTime;
  final Value<int> rowid;
  const ListenedTrackCompanion({
    this.trackId = const Value.absent(),
    this.listenedTimeInSeconds = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ListenedTrackCompanion.insert({
    required int trackId,
    required int listenedTimeInSeconds,
    required DateTime createdTime,
    this.rowid = const Value.absent(),
  }) : trackId = Value(trackId),
       listenedTimeInSeconds = Value(listenedTimeInSeconds),
       createdTime = Value(createdTime);
  static Insertable<ListenedTrackData> custom({
    Expression<int>? trackId,
    Expression<int>? listenedTimeInSeconds,
    Expression<DateTime>? createdTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trackId != null) 'track_id': trackId,
      if (listenedTimeInSeconds != null)
        'listened_time_in_seconds': listenedTimeInSeconds,
      if (createdTime != null) 'created_time': createdTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ListenedTrackCompanion copyWith({
    Value<int>? trackId,
    Value<int>? listenedTimeInSeconds,
    Value<DateTime>? createdTime,
    Value<int>? rowid,
  }) {
    return ListenedTrackCompanion(
      trackId: trackId ?? this.trackId,
      listenedTimeInSeconds:
          listenedTimeInSeconds ?? this.listenedTimeInSeconds,
      createdTime: createdTime ?? this.createdTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trackId.present) {
      map['track_id'] = Variable<int>(trackId.value);
    }
    if (listenedTimeInSeconds.present) {
      map['listened_time_in_seconds'] = Variable<int>(
        listenedTimeInSeconds.value,
      );
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListenedTrackCompanion(')
          ..write('trackId: $trackId, ')
          ..write('listenedTimeInSeconds: $listenedTimeInSeconds, ')
          ..write('createdTime: $createdTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlaylistTable extends Playlist
    with TableInfo<$PlaylistTable, PlaylistData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, imagePath, createdTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaylistData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaylistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
    );
  }

  @override
  $PlaylistTable createAlias(String alias) {
    return $PlaylistTable(attachedDatabase, alias);
  }
}

class PlaylistData extends DataClass implements Insertable<PlaylistData> {
  final int id;
  final String? name;
  final String? imagePath;
  final DateTime createdTime;
  const PlaylistData({
    required this.id,
    this.name,
    this.imagePath,
    required this.createdTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    return map;
  }

  PlaylistCompanion toCompanion(bool nullToAbsent) {
    return PlaylistCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdTime: Value(createdTime),
    );
  }

  factory PlaylistData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdTime': serializer.toJson<DateTime>(createdTime),
    };
  }

  PlaylistData copyWith({
    int? id,
    Value<String?> name = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    DateTime? createdTime,
  }) => PlaylistData(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    createdTime: createdTime ?? this.createdTime,
  );
  PlaylistData copyWithCompanion(PlaylistCompanion data) {
    return PlaylistData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imagePath, createdTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistData &&
          other.id == this.id &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.createdTime == this.createdTime);
}

class PlaylistCompanion extends UpdateCompanion<PlaylistData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> imagePath;
  final Value<DateTime> createdTime;
  const PlaylistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdTime = const Value.absent(),
  });
  PlaylistCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdTime = const Value.absent(),
  });
  static Insertable<PlaylistData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? imagePath,
    Expression<DateTime>? createdTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
      if (createdTime != null) 'created_time': createdTime,
    });
  }

  PlaylistCompanion copyWith({
    Value<int>? id,
    Value<String?>? name,
    Value<String?>? imagePath,
    Value<DateTime>? createdTime,
  }) {
    return PlaylistCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }
}

class $PlaylistTrackTable extends PlaylistTrack
    with TableInfo<$PlaylistTrackTable, PlaylistTrackData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistTrackTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trackIdMeta = const VerificationMeta(
    'trackId',
  );
  @override
  late final GeneratedColumn<int> trackId = GeneratedColumn<int>(
    'track_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tracks (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlist (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    trackId,
    playlistId,
    position,
    createdTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist_track';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaylistTrackData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('track_id')) {
      context.handle(
        _trackIdMeta,
        trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PlaylistTrackData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistTrackData(
      trackId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}track_id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
    );
  }

  @override
  $PlaylistTrackTable createAlias(String alias) {
    return $PlaylistTrackTable(attachedDatabase, alias);
  }
}

class PlaylistTrackData extends DataClass
    implements Insertable<PlaylistTrackData> {
  final int trackId;
  final int playlistId;
  final int position;
  final DateTime createdTime;
  const PlaylistTrackData({
    required this.trackId,
    required this.playlistId,
    required this.position,
    required this.createdTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['track_id'] = Variable<int>(trackId);
    map['playlist_id'] = Variable<int>(playlistId);
    map['position'] = Variable<int>(position);
    map['created_time'] = Variable<DateTime>(createdTime);
    return map;
  }

  PlaylistTrackCompanion toCompanion(bool nullToAbsent) {
    return PlaylistTrackCompanion(
      trackId: Value(trackId),
      playlistId: Value(playlistId),
      position: Value(position),
      createdTime: Value(createdTime),
    );
  }

  factory PlaylistTrackData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistTrackData(
      trackId: serializer.fromJson<int>(json['trackId']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      position: serializer.fromJson<int>(json['position']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trackId': serializer.toJson<int>(trackId),
      'playlistId': serializer.toJson<int>(playlistId),
      'position': serializer.toJson<int>(position),
      'createdTime': serializer.toJson<DateTime>(createdTime),
    };
  }

  PlaylistTrackData copyWith({
    int? trackId,
    int? playlistId,
    int? position,
    DateTime? createdTime,
  }) => PlaylistTrackData(
    trackId: trackId ?? this.trackId,
    playlistId: playlistId ?? this.playlistId,
    position: position ?? this.position,
    createdTime: createdTime ?? this.createdTime,
  );
  PlaylistTrackData copyWithCompanion(PlaylistTrackCompanion data) {
    return PlaylistTrackData(
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      position: data.position.present ? data.position.value : this.position,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistTrackData(')
          ..write('trackId: $trackId, ')
          ..write('playlistId: $playlistId, ')
          ..write('position: $position, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(trackId, playlistId, position, createdTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistTrackData &&
          other.trackId == this.trackId &&
          other.playlistId == this.playlistId &&
          other.position == this.position &&
          other.createdTime == this.createdTime);
}

class PlaylistTrackCompanion extends UpdateCompanion<PlaylistTrackData> {
  final Value<int> trackId;
  final Value<int> playlistId;
  final Value<int> position;
  final Value<DateTime> createdTime;
  final Value<int> rowid;
  const PlaylistTrackCompanion({
    this.trackId = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.position = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaylistTrackCompanion.insert({
    required int trackId,
    required int playlistId,
    required int position,
    this.createdTime = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : trackId = Value(trackId),
       playlistId = Value(playlistId),
       position = Value(position);
  static Insertable<PlaylistTrackData> custom({
    Expression<int>? trackId,
    Expression<int>? playlistId,
    Expression<int>? position,
    Expression<DateTime>? createdTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trackId != null) 'track_id': trackId,
      if (playlistId != null) 'playlist_id': playlistId,
      if (position != null) 'position': position,
      if (createdTime != null) 'created_time': createdTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaylistTrackCompanion copyWith({
    Value<int>? trackId,
    Value<int>? playlistId,
    Value<int>? position,
    Value<DateTime>? createdTime,
    Value<int>? rowid,
  }) {
    return PlaylistTrackCompanion(
      trackId: trackId ?? this.trackId,
      playlistId: playlistId ?? this.playlistId,
      position: position ?? this.position,
      createdTime: createdTime ?? this.createdTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trackId.present) {
      map['track_id'] = Variable<int>(trackId.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistTrackCompanion(')
          ..write('trackId: $trackId, ')
          ..write('playlistId: $playlistId, ')
          ..write('position: $position, ')
          ..write('createdTime: $createdTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PictureTable extends Picture with TableInfo<$PictureTable, PictureData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PictureTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trackPathMeta = const VerificationMeta(
    'trackPath',
  );
  @override
  late final GeneratedColumn<String> trackPath = GeneratedColumn<String>(
    'track_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tracks (file_path) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _bytesMeta = const VerificationMeta('bytes');
  @override
  late final GeneratedColumn<Uint8List> bytes = GeneratedColumn<Uint8List>(
    'bytes',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pictureTypeMeta = const VerificationMeta(
    'pictureType',
  );
  @override
  late final GeneratedColumn<String> pictureType = GeneratedColumn<String>(
    'picture_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    trackPath,
    bytes,
    mimeType,
    pictureType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'picture';
  @override
  VerificationContext validateIntegrity(
    Insertable<PictureData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('track_path')) {
      context.handle(
        _trackPathMeta,
        trackPath.isAcceptableOrUnknown(data['track_path']!, _trackPathMeta),
      );
    } else if (isInserting) {
      context.missing(_trackPathMeta);
    }
    if (data.containsKey('bytes')) {
      context.handle(
        _bytesMeta,
        bytes.isAcceptableOrUnknown(data['bytes']!, _bytesMeta),
      );
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    }
    if (data.containsKey('picture_type')) {
      context.handle(
        _pictureTypeMeta,
        pictureType.isAcceptableOrUnknown(
          data['picture_type']!,
          _pictureTypeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PictureData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PictureData(
      trackPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_path'],
      )!,
      bytes: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}bytes'],
      ),
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      ),
      pictureType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}picture_type'],
      ),
    );
  }

  @override
  $PictureTable createAlias(String alias) {
    return $PictureTable(attachedDatabase, alias);
  }
}

class PictureData extends DataClass implements Insertable<PictureData> {
  final String trackPath;
  final Uint8List? bytes;
  final String? mimeType;
  final String? pictureType;
  const PictureData({
    required this.trackPath,
    this.bytes,
    this.mimeType,
    this.pictureType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['track_path'] = Variable<String>(trackPath);
    if (!nullToAbsent || bytes != null) {
      map['bytes'] = Variable<Uint8List>(bytes);
    }
    if (!nullToAbsent || mimeType != null) {
      map['mime_type'] = Variable<String>(mimeType);
    }
    if (!nullToAbsent || pictureType != null) {
      map['picture_type'] = Variable<String>(pictureType);
    }
    return map;
  }

  PictureCompanion toCompanion(bool nullToAbsent) {
    return PictureCompanion(
      trackPath: Value(trackPath),
      bytes: bytes == null && nullToAbsent
          ? const Value.absent()
          : Value(bytes),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
      pictureType: pictureType == null && nullToAbsent
          ? const Value.absent()
          : Value(pictureType),
    );
  }

  factory PictureData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PictureData(
      trackPath: serializer.fromJson<String>(json['trackPath']),
      bytes: serializer.fromJson<Uint8List?>(json['bytes']),
      mimeType: serializer.fromJson<String?>(json['mimeType']),
      pictureType: serializer.fromJson<String?>(json['pictureType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trackPath': serializer.toJson<String>(trackPath),
      'bytes': serializer.toJson<Uint8List?>(bytes),
      'mimeType': serializer.toJson<String?>(mimeType),
      'pictureType': serializer.toJson<String?>(pictureType),
    };
  }

  PictureData copyWith({
    String? trackPath,
    Value<Uint8List?> bytes = const Value.absent(),
    Value<String?> mimeType = const Value.absent(),
    Value<String?> pictureType = const Value.absent(),
  }) => PictureData(
    trackPath: trackPath ?? this.trackPath,
    bytes: bytes.present ? bytes.value : this.bytes,
    mimeType: mimeType.present ? mimeType.value : this.mimeType,
    pictureType: pictureType.present ? pictureType.value : this.pictureType,
  );
  PictureData copyWithCompanion(PictureCompanion data) {
    return PictureData(
      trackPath: data.trackPath.present ? data.trackPath.value : this.trackPath,
      bytes: data.bytes.present ? data.bytes.value : this.bytes,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      pictureType: data.pictureType.present
          ? data.pictureType.value
          : this.pictureType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PictureData(')
          ..write('trackPath: $trackPath, ')
          ..write('bytes: $bytes, ')
          ..write('mimeType: $mimeType, ')
          ..write('pictureType: $pictureType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    trackPath,
    $driftBlobEquality.hash(bytes),
    mimeType,
    pictureType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PictureData &&
          other.trackPath == this.trackPath &&
          $driftBlobEquality.equals(other.bytes, this.bytes) &&
          other.mimeType == this.mimeType &&
          other.pictureType == this.pictureType);
}

class PictureCompanion extends UpdateCompanion<PictureData> {
  final Value<String> trackPath;
  final Value<Uint8List?> bytes;
  final Value<String?> mimeType;
  final Value<String?> pictureType;
  final Value<int> rowid;
  const PictureCompanion({
    this.trackPath = const Value.absent(),
    this.bytes = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.pictureType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PictureCompanion.insert({
    required String trackPath,
    this.bytes = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.pictureType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : trackPath = Value(trackPath);
  static Insertable<PictureData> custom({
    Expression<String>? trackPath,
    Expression<Uint8List>? bytes,
    Expression<String>? mimeType,
    Expression<String>? pictureType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trackPath != null) 'track_path': trackPath,
      if (bytes != null) 'bytes': bytes,
      if (mimeType != null) 'mime_type': mimeType,
      if (pictureType != null) 'picture_type': pictureType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PictureCompanion copyWith({
    Value<String>? trackPath,
    Value<Uint8List?>? bytes,
    Value<String?>? mimeType,
    Value<String?>? pictureType,
    Value<int>? rowid,
  }) {
    return PictureCompanion(
      trackPath: trackPath ?? this.trackPath,
      bytes: bytes ?? this.bytes,
      mimeType: mimeType ?? this.mimeType,
      pictureType: pictureType ?? this.pictureType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trackPath.present) {
      map['track_path'] = Variable<String>(trackPath.value);
    }
    if (bytes.present) {
      map['bytes'] = Variable<Uint8List>(bytes.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (pictureType.present) {
      map['picture_type'] = Variable<String>(pictureType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PictureCompanion(')
          ..write('trackPath: $trackPath, ')
          ..write('bytes: $bytes, ')
          ..write('mimeType: $mimeType, ')
          ..write('pictureType: $pictureType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoriteTrackTable extends FavoriteTrack
    with TableInfo<$FavoriteTrackTable, FavoriteTrackData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteTrackTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trackIdMeta = const VerificationMeta(
    'trackId',
  );
  @override
  late final GeneratedColumn<int> trackId = GeneratedColumn<int>(
    'track_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES tracks (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [trackId, createdTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_track';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteTrackData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('track_id')) {
      context.handle(
        _trackIdMeta,
        trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FavoriteTrackData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteTrackData(
      trackId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}track_id'],
      )!,
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
    );
  }

  @override
  $FavoriteTrackTable createAlias(String alias) {
    return $FavoriteTrackTable(attachedDatabase, alias);
  }
}

class FavoriteTrackData extends DataClass
    implements Insertable<FavoriteTrackData> {
  final int trackId;
  final DateTime createdTime;
  const FavoriteTrackData({required this.trackId, required this.createdTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['track_id'] = Variable<int>(trackId);
    map['created_time'] = Variable<DateTime>(createdTime);
    return map;
  }

  FavoriteTrackCompanion toCompanion(bool nullToAbsent) {
    return FavoriteTrackCompanion(
      trackId: Value(trackId),
      createdTime: Value(createdTime),
    );
  }

  factory FavoriteTrackData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteTrackData(
      trackId: serializer.fromJson<int>(json['trackId']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trackId': serializer.toJson<int>(trackId),
      'createdTime': serializer.toJson<DateTime>(createdTime),
    };
  }

  FavoriteTrackData copyWith({int? trackId, DateTime? createdTime}) =>
      FavoriteTrackData(
        trackId: trackId ?? this.trackId,
        createdTime: createdTime ?? this.createdTime,
      );
  FavoriteTrackData copyWithCompanion(FavoriteTrackCompanion data) {
    return FavoriteTrackData(
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteTrackData(')
          ..write('trackId: $trackId, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(trackId, createdTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteTrackData &&
          other.trackId == this.trackId &&
          other.createdTime == this.createdTime);
}

class FavoriteTrackCompanion extends UpdateCompanion<FavoriteTrackData> {
  final Value<int> trackId;
  final Value<DateTime> createdTime;
  final Value<int> rowid;
  const FavoriteTrackCompanion({
    this.trackId = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteTrackCompanion.insert({
    required int trackId,
    this.createdTime = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : trackId = Value(trackId);
  static Insertable<FavoriteTrackData> custom({
    Expression<int>? trackId,
    Expression<DateTime>? createdTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trackId != null) 'track_id': trackId,
      if (createdTime != null) 'created_time': createdTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteTrackCompanion copyWith({
    Value<int>? trackId,
    Value<DateTime>? createdTime,
    Value<int>? rowid,
  }) {
    return FavoriteTrackCompanion(
      trackId: trackId ?? this.trackId,
      createdTime: createdTime ?? this.createdTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trackId.present) {
      map['track_id'] = Variable<int>(trackId.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteTrackCompanion(')
          ..write('trackId: $trackId, ')
          ..write('createdTime: $createdTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritePlaylistTable extends FavoritePlaylist
    with TableInfo<$FavoritePlaylistTable, FavoritePlaylistData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritePlaylistTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES playlist (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _createdTimeMeta = const VerificationMeta(
    'createdTime',
  );
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
    'created_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [playlistId, createdTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_playlist';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoritePlaylistData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
        _createdTimeMeta,
        createdTime.isAcceptableOrUnknown(
          data['created_time']!,
          _createdTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FavoritePlaylistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritePlaylistData(
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      createdTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_time'],
      )!,
    );
  }

  @override
  $FavoritePlaylistTable createAlias(String alias) {
    return $FavoritePlaylistTable(attachedDatabase, alias);
  }
}

class FavoritePlaylistData extends DataClass
    implements Insertable<FavoritePlaylistData> {
  final int playlistId;
  final DateTime createdTime;
  const FavoritePlaylistData({
    required this.playlistId,
    required this.createdTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['playlist_id'] = Variable<int>(playlistId);
    map['created_time'] = Variable<DateTime>(createdTime);
    return map;
  }

  FavoritePlaylistCompanion toCompanion(bool nullToAbsent) {
    return FavoritePlaylistCompanion(
      playlistId: Value(playlistId),
      createdTime: Value(createdTime),
    );
  }

  factory FavoritePlaylistData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritePlaylistData(
      playlistId: serializer.fromJson<int>(json['playlistId']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'playlistId': serializer.toJson<int>(playlistId),
      'createdTime': serializer.toJson<DateTime>(createdTime),
    };
  }

  FavoritePlaylistData copyWith({int? playlistId, DateTime? createdTime}) =>
      FavoritePlaylistData(
        playlistId: playlistId ?? this.playlistId,
        createdTime: createdTime ?? this.createdTime,
      );
  FavoritePlaylistData copyWithCompanion(FavoritePlaylistCompanion data) {
    return FavoritePlaylistData(
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      createdTime: data.createdTime.present
          ? data.createdTime.value
          : this.createdTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePlaylistData(')
          ..write('playlistId: $playlistId, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(playlistId, createdTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritePlaylistData &&
          other.playlistId == this.playlistId &&
          other.createdTime == this.createdTime);
}

class FavoritePlaylistCompanion extends UpdateCompanion<FavoritePlaylistData> {
  final Value<int> playlistId;
  final Value<DateTime> createdTime;
  final Value<int> rowid;
  const FavoritePlaylistCompanion({
    this.playlistId = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritePlaylistCompanion.insert({
    required int playlistId,
    this.createdTime = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : playlistId = Value(playlistId);
  static Insertable<FavoritePlaylistData> custom({
    Expression<int>? playlistId,
    Expression<DateTime>? createdTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (playlistId != null) 'playlist_id': playlistId,
      if (createdTime != null) 'created_time': createdTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritePlaylistCompanion copyWith({
    Value<int>? playlistId,
    Value<DateTime>? createdTime,
    Value<int>? rowid,
  }) {
    return FavoritePlaylistCompanion(
      playlistId: playlistId ?? this.playlistId,
      createdTime: createdTime ?? this.createdTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePlaylistCompanion(')
          ..write('playlistId: $playlistId, ')
          ..write('createdTime: $createdTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TracksTable tracks = $TracksTable(this);
  late final $ListenedTrackTable listenedTrack = $ListenedTrackTable(this);
  late final $PlaylistTable playlist = $PlaylistTable(this);
  late final $PlaylistTrackTable playlistTrack = $PlaylistTrackTable(this);
  late final $PictureTable picture = $PictureTable(this);
  late final $FavoriteTrackTable favoriteTrack = $FavoriteTrackTable(this);
  late final $FavoritePlaylistTable favoritePlaylist = $FavoritePlaylistTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tracks,
    listenedTrack,
    playlist,
    playlistTrack,
    picture,
    favoriteTrack,
    favoritePlaylist,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tracks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('listened_track', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tracks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('playlist_track', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tracks',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('playlist_track', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'playlist',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('playlist_track', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'playlist',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('playlist_track', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tracks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('picture', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tracks',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('picture', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tracks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('favorite_track', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tracks',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('favorite_track', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'playlist',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('favorite_playlist', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'playlist',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('favorite_playlist', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$TracksTableCreateCompanionBuilder =
    TracksCompanion Function({
      Value<int> id,
      Value<String?> trackTitle,
      Value<String?> trackArtist,
      Value<int?> trackDurationInMilliseconds,
      Value<int?> sampleRate,
      Value<String?> language,
      Value<String?> lyrics,
      Value<String?> performers,
      Value<String?> album,
      Value<int?> discNumber,
      Value<int?> discTotal,
      Value<int?> trackNumber,
      Value<int?> trackTotal,
      required Genres genreList,
      Value<DateTime?> releaseYear,
      required String directoryPath,
      required String filePath,
      required String fileBaseName,
      Value<int?> fileSize,
      Value<DateTime> createdTime,
      Value<bool> playbackError,
    });
typedef $$TracksTableUpdateCompanionBuilder =
    TracksCompanion Function({
      Value<int> id,
      Value<String?> trackTitle,
      Value<String?> trackArtist,
      Value<int?> trackDurationInMilliseconds,
      Value<int?> sampleRate,
      Value<String?> language,
      Value<String?> lyrics,
      Value<String?> performers,
      Value<String?> album,
      Value<int?> discNumber,
      Value<int?> discTotal,
      Value<int?> trackNumber,
      Value<int?> trackTotal,
      Value<Genres> genreList,
      Value<DateTime?> releaseYear,
      Value<String> directoryPath,
      Value<String> filePath,
      Value<String> fileBaseName,
      Value<int?> fileSize,
      Value<DateTime> createdTime,
      Value<bool> playbackError,
    });

final class $$TracksTableReferences
    extends BaseReferences<_$AppDatabase, $TracksTable, Track> {
  $$TracksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ListenedTrackTable, List<ListenedTrackData>>
  _listenedTrackRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.listenedTrack,
    aliasName: $_aliasNameGenerator(db.tracks.id, db.listenedTrack.trackId),
  );

  $$ListenedTrackTableProcessedTableManager get listenedTrackRefs {
    final manager = $$ListenedTrackTableTableManager(
      $_db,
      $_db.listenedTrack,
    ).filter((f) => f.trackId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_listenedTrackRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PlaylistTrackTable, List<PlaylistTrackData>>
  _playlistTrackRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.playlistTrack,
    aliasName: $_aliasNameGenerator(db.tracks.id, db.playlistTrack.trackId),
  );

  $$PlaylistTrackTableProcessedTableManager get playlistTrackRefs {
    final manager = $$PlaylistTrackTableTableManager(
      $_db,
      $_db.playlistTrack,
    ).filter((f) => f.trackId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_playlistTrackRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PictureTable, List<PictureData>>
  _pictureRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.picture,
    aliasName: $_aliasNameGenerator(db.tracks.filePath, db.picture.trackPath),
  );

  $$PictureTableProcessedTableManager get pictureRefs {
    final manager = $$PictureTableTableManager($_db, $_db.picture).filter(
      (f) => f.trackPath.filePath.sqlEquals($_itemColumn<String>('file_path')!),
    );

    final cache = $_typedResult.readTableOrNull(_pictureRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FavoriteTrackTable, List<FavoriteTrackData>>
  _favoriteTrackRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.favoriteTrack,
    aliasName: $_aliasNameGenerator(db.tracks.id, db.favoriteTrack.trackId),
  );

  $$FavoriteTrackTableProcessedTableManager get favoriteTrackRefs {
    final manager = $$FavoriteTrackTableTableManager(
      $_db,
      $_db.favoriteTrack,
    ).filter((f) => f.trackId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_favoriteTrackRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TracksTableFilterComposer
    extends Composer<_$AppDatabase, $TracksTable> {
  $$TracksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trackTitle => $composableBuilder(
    column: $table.trackTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trackArtist => $composableBuilder(
    column: $table.trackArtist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trackDurationInMilliseconds => $composableBuilder(
    column: $table.trackDurationInMilliseconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sampleRate => $composableBuilder(
    column: $table.sampleRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lyrics => $composableBuilder(
    column: $table.lyrics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get performers => $composableBuilder(
    column: $table.performers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discNumber => $composableBuilder(
    column: $table.discNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discTotal => $composableBuilder(
    column: $table.discTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trackNumber => $composableBuilder(
    column: $table.trackNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trackTotal => $composableBuilder(
    column: $table.trackTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Genres, Genres, String> get genreList =>
      $composableBuilder(
        column: $table.genreList,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get releaseYear => $composableBuilder(
    column: $table.releaseYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get directoryPath => $composableBuilder(
    column: $table.directoryPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileBaseName => $composableBuilder(
    column: $table.fileBaseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get playbackError => $composableBuilder(
    column: $table.playbackError,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> listenedTrackRefs(
    Expression<bool> Function($$ListenedTrackTableFilterComposer f) f,
  ) {
    final $$ListenedTrackTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.listenedTrack,
      getReferencedColumn: (t) => t.trackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ListenedTrackTableFilterComposer(
            $db: $db,
            $table: $db.listenedTrack,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> playlistTrackRefs(
    Expression<bool> Function($$PlaylistTrackTableFilterComposer f) f,
  ) {
    final $$PlaylistTrackTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playlistTrack,
      getReferencedColumn: (t) => t.trackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTrackTableFilterComposer(
            $db: $db,
            $table: $db.playlistTrack,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> pictureRefs(
    Expression<bool> Function($$PictureTableFilterComposer f) f,
  ) {
    final $$PictureTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.filePath,
      referencedTable: $db.picture,
      getReferencedColumn: (t) => t.trackPath,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PictureTableFilterComposer(
            $db: $db,
            $table: $db.picture,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> favoriteTrackRefs(
    Expression<bool> Function($$FavoriteTrackTableFilterComposer f) f,
  ) {
    final $$FavoriteTrackTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favoriteTrack,
      getReferencedColumn: (t) => t.trackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoriteTrackTableFilterComposer(
            $db: $db,
            $table: $db.favoriteTrack,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TracksTableOrderingComposer
    extends Composer<_$AppDatabase, $TracksTable> {
  $$TracksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trackTitle => $composableBuilder(
    column: $table.trackTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trackArtist => $composableBuilder(
    column: $table.trackArtist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trackDurationInMilliseconds => $composableBuilder(
    column: $table.trackDurationInMilliseconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sampleRate => $composableBuilder(
    column: $table.sampleRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lyrics => $composableBuilder(
    column: $table.lyrics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get performers => $composableBuilder(
    column: $table.performers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discNumber => $composableBuilder(
    column: $table.discNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discTotal => $composableBuilder(
    column: $table.discTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trackNumber => $composableBuilder(
    column: $table.trackNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trackTotal => $composableBuilder(
    column: $table.trackTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genreList => $composableBuilder(
    column: $table.genreList,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get releaseYear => $composableBuilder(
    column: $table.releaseYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get directoryPath => $composableBuilder(
    column: $table.directoryPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileBaseName => $composableBuilder(
    column: $table.fileBaseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get playbackError => $composableBuilder(
    column: $table.playbackError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TracksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TracksTable> {
  $$TracksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get trackTitle => $composableBuilder(
    column: $table.trackTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trackArtist => $composableBuilder(
    column: $table.trackArtist,
    builder: (column) => column,
  );

  GeneratedColumn<int> get trackDurationInMilliseconds => $composableBuilder(
    column: $table.trackDurationInMilliseconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sampleRate => $composableBuilder(
    column: $table.sampleRate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get lyrics =>
      $composableBuilder(column: $table.lyrics, builder: (column) => column);

  GeneratedColumn<String> get performers => $composableBuilder(
    column: $table.performers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get album =>
      $composableBuilder(column: $table.album, builder: (column) => column);

  GeneratedColumn<int> get discNumber => $composableBuilder(
    column: $table.discNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get discTotal =>
      $composableBuilder(column: $table.discTotal, builder: (column) => column);

  GeneratedColumn<int> get trackNumber => $composableBuilder(
    column: $table.trackNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get trackTotal => $composableBuilder(
    column: $table.trackTotal,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Genres, String> get genreList =>
      $composableBuilder(column: $table.genreList, builder: (column) => column);

  GeneratedColumn<DateTime> get releaseYear => $composableBuilder(
    column: $table.releaseYear,
    builder: (column) => column,
  );

  GeneratedColumn<String> get directoryPath => $composableBuilder(
    column: $table.directoryPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileBaseName => $composableBuilder(
    column: $table.fileBaseName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get playbackError => $composableBuilder(
    column: $table.playbackError,
    builder: (column) => column,
  );

  Expression<T> listenedTrackRefs<T extends Object>(
    Expression<T> Function($$ListenedTrackTableAnnotationComposer a) f,
  ) {
    final $$ListenedTrackTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.listenedTrack,
      getReferencedColumn: (t) => t.trackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ListenedTrackTableAnnotationComposer(
            $db: $db,
            $table: $db.listenedTrack,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> playlistTrackRefs<T extends Object>(
    Expression<T> Function($$PlaylistTrackTableAnnotationComposer a) f,
  ) {
    final $$PlaylistTrackTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playlistTrack,
      getReferencedColumn: (t) => t.trackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTrackTableAnnotationComposer(
            $db: $db,
            $table: $db.playlistTrack,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> pictureRefs<T extends Object>(
    Expression<T> Function($$PictureTableAnnotationComposer a) f,
  ) {
    final $$PictureTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.filePath,
      referencedTable: $db.picture,
      getReferencedColumn: (t) => t.trackPath,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PictureTableAnnotationComposer(
            $db: $db,
            $table: $db.picture,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> favoriteTrackRefs<T extends Object>(
    Expression<T> Function($$FavoriteTrackTableAnnotationComposer a) f,
  ) {
    final $$FavoriteTrackTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favoriteTrack,
      getReferencedColumn: (t) => t.trackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoriteTrackTableAnnotationComposer(
            $db: $db,
            $table: $db.favoriteTrack,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TracksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TracksTable,
          Track,
          $$TracksTableFilterComposer,
          $$TracksTableOrderingComposer,
          $$TracksTableAnnotationComposer,
          $$TracksTableCreateCompanionBuilder,
          $$TracksTableUpdateCompanionBuilder,
          (Track, $$TracksTableReferences),
          Track,
          PrefetchHooks Function({
            bool listenedTrackRefs,
            bool playlistTrackRefs,
            bool pictureRefs,
            bool favoriteTrackRefs,
          })
        > {
  $$TracksTableTableManager(_$AppDatabase db, $TracksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TracksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TracksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TracksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> trackTitle = const Value.absent(),
                Value<String?> trackArtist = const Value.absent(),
                Value<int?> trackDurationInMilliseconds = const Value.absent(),
                Value<int?> sampleRate = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<String?> lyrics = const Value.absent(),
                Value<String?> performers = const Value.absent(),
                Value<String?> album = const Value.absent(),
                Value<int?> discNumber = const Value.absent(),
                Value<int?> discTotal = const Value.absent(),
                Value<int?> trackNumber = const Value.absent(),
                Value<int?> trackTotal = const Value.absent(),
                Value<Genres> genreList = const Value.absent(),
                Value<DateTime?> releaseYear = const Value.absent(),
                Value<String> directoryPath = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String> fileBaseName = const Value.absent(),
                Value<int?> fileSize = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<bool> playbackError = const Value.absent(),
              }) => TracksCompanion(
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
                genreList: genreList,
                releaseYear: releaseYear,
                directoryPath: directoryPath,
                filePath: filePath,
                fileBaseName: fileBaseName,
                fileSize: fileSize,
                createdTime: createdTime,
                playbackError: playbackError,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> trackTitle = const Value.absent(),
                Value<String?> trackArtist = const Value.absent(),
                Value<int?> trackDurationInMilliseconds = const Value.absent(),
                Value<int?> sampleRate = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<String?> lyrics = const Value.absent(),
                Value<String?> performers = const Value.absent(),
                Value<String?> album = const Value.absent(),
                Value<int?> discNumber = const Value.absent(),
                Value<int?> discTotal = const Value.absent(),
                Value<int?> trackNumber = const Value.absent(),
                Value<int?> trackTotal = const Value.absent(),
                required Genres genreList,
                Value<DateTime?> releaseYear = const Value.absent(),
                required String directoryPath,
                required String filePath,
                required String fileBaseName,
                Value<int?> fileSize = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<bool> playbackError = const Value.absent(),
              }) => TracksCompanion.insert(
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
                genreList: genreList,
                releaseYear: releaseYear,
                directoryPath: directoryPath,
                filePath: filePath,
                fileBaseName: fileBaseName,
                fileSize: fileSize,
                createdTime: createdTime,
                playbackError: playbackError,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TracksTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                listenedTrackRefs = false,
                playlistTrackRefs = false,
                pictureRefs = false,
                favoriteTrackRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (listenedTrackRefs) db.listenedTrack,
                    if (playlistTrackRefs) db.playlistTrack,
                    if (pictureRefs) db.picture,
                    if (favoriteTrackRefs) db.favoriteTrack,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (listenedTrackRefs)
                        await $_getPrefetchedData<
                          Track,
                          $TracksTable,
                          ListenedTrackData
                        >(
                          currentTable: table,
                          referencedTable: $$TracksTableReferences
                              ._listenedTrackRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TracksTableReferences(
                                db,
                                table,
                                p0,
                              ).listenedTrackRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.trackId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (playlistTrackRefs)
                        await $_getPrefetchedData<
                          Track,
                          $TracksTable,
                          PlaylistTrackData
                        >(
                          currentTable: table,
                          referencedTable: $$TracksTableReferences
                              ._playlistTrackRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TracksTableReferences(
                                db,
                                table,
                                p0,
                              ).playlistTrackRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.trackId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (pictureRefs)
                        await $_getPrefetchedData<
                          Track,
                          $TracksTable,
                          PictureData
                        >(
                          currentTable: table,
                          referencedTable: $$TracksTableReferences
                              ._pictureRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TracksTableReferences(
                                db,
                                table,
                                p0,
                              ).pictureRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.trackPath == item.filePath,
                              ),
                          typedResults: items,
                        ),
                      if (favoriteTrackRefs)
                        await $_getPrefetchedData<
                          Track,
                          $TracksTable,
                          FavoriteTrackData
                        >(
                          currentTable: table,
                          referencedTable: $$TracksTableReferences
                              ._favoriteTrackRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TracksTableReferences(
                                db,
                                table,
                                p0,
                              ).favoriteTrackRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.trackId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TracksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TracksTable,
      Track,
      $$TracksTableFilterComposer,
      $$TracksTableOrderingComposer,
      $$TracksTableAnnotationComposer,
      $$TracksTableCreateCompanionBuilder,
      $$TracksTableUpdateCompanionBuilder,
      (Track, $$TracksTableReferences),
      Track,
      PrefetchHooks Function({
        bool listenedTrackRefs,
        bool playlistTrackRefs,
        bool pictureRefs,
        bool favoriteTrackRefs,
      })
    >;
typedef $$ListenedTrackTableCreateCompanionBuilder =
    ListenedTrackCompanion Function({
      required int trackId,
      required int listenedTimeInSeconds,
      required DateTime createdTime,
      Value<int> rowid,
    });
typedef $$ListenedTrackTableUpdateCompanionBuilder =
    ListenedTrackCompanion Function({
      Value<int> trackId,
      Value<int> listenedTimeInSeconds,
      Value<DateTime> createdTime,
      Value<int> rowid,
    });

final class $$ListenedTrackTableReferences
    extends
        BaseReferences<_$AppDatabase, $ListenedTrackTable, ListenedTrackData> {
  $$ListenedTrackTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TracksTable _trackIdTable(_$AppDatabase db) => db.tracks.createAlias(
    $_aliasNameGenerator(db.listenedTrack.trackId, db.tracks.id),
  );

  $$TracksTableProcessedTableManager get trackId {
    final $_column = $_itemColumn<int>('track_id')!;

    final manager = $$TracksTableTableManager(
      $_db,
      $_db.tracks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_trackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ListenedTrackTableFilterComposer
    extends Composer<_$AppDatabase, $ListenedTrackTable> {
  $$ListenedTrackTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get listenedTimeInSeconds => $composableBuilder(
    column: $table.listenedTimeInSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  $$TracksTableFilterComposer get trackId {
    final $$TracksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackId,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableFilterComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ListenedTrackTableOrderingComposer
    extends Composer<_$AppDatabase, $ListenedTrackTable> {
  $$ListenedTrackTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get listenedTimeInSeconds => $composableBuilder(
    column: $table.listenedTimeInSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  $$TracksTableOrderingComposer get trackId {
    final $$TracksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackId,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableOrderingComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ListenedTrackTableAnnotationComposer
    extends Composer<_$AppDatabase, $ListenedTrackTable> {
  $$ListenedTrackTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get listenedTimeInSeconds => $composableBuilder(
    column: $table.listenedTimeInSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  $$TracksTableAnnotationComposer get trackId {
    final $$TracksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackId,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableAnnotationComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ListenedTrackTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ListenedTrackTable,
          ListenedTrackData,
          $$ListenedTrackTableFilterComposer,
          $$ListenedTrackTableOrderingComposer,
          $$ListenedTrackTableAnnotationComposer,
          $$ListenedTrackTableCreateCompanionBuilder,
          $$ListenedTrackTableUpdateCompanionBuilder,
          (ListenedTrackData, $$ListenedTrackTableReferences),
          ListenedTrackData,
          PrefetchHooks Function({bool trackId})
        > {
  $$ListenedTrackTableTableManager(_$AppDatabase db, $ListenedTrackTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ListenedTrackTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ListenedTrackTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ListenedTrackTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> trackId = const Value.absent(),
                Value<int> listenedTimeInSeconds = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ListenedTrackCompanion(
                trackId: trackId,
                listenedTimeInSeconds: listenedTimeInSeconds,
                createdTime: createdTime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int trackId,
                required int listenedTimeInSeconds,
                required DateTime createdTime,
                Value<int> rowid = const Value.absent(),
              }) => ListenedTrackCompanion.insert(
                trackId: trackId,
                listenedTimeInSeconds: listenedTimeInSeconds,
                createdTime: createdTime,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ListenedTrackTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({trackId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (trackId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.trackId,
                                referencedTable: $$ListenedTrackTableReferences
                                    ._trackIdTable(db),
                                referencedColumn: $$ListenedTrackTableReferences
                                    ._trackIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ListenedTrackTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ListenedTrackTable,
      ListenedTrackData,
      $$ListenedTrackTableFilterComposer,
      $$ListenedTrackTableOrderingComposer,
      $$ListenedTrackTableAnnotationComposer,
      $$ListenedTrackTableCreateCompanionBuilder,
      $$ListenedTrackTableUpdateCompanionBuilder,
      (ListenedTrackData, $$ListenedTrackTableReferences),
      ListenedTrackData,
      PrefetchHooks Function({bool trackId})
    >;
typedef $$PlaylistTableCreateCompanionBuilder =
    PlaylistCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<String?> imagePath,
      Value<DateTime> createdTime,
    });
typedef $$PlaylistTableUpdateCompanionBuilder =
    PlaylistCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<String?> imagePath,
      Value<DateTime> createdTime,
    });

final class $$PlaylistTableReferences
    extends BaseReferences<_$AppDatabase, $PlaylistTable, PlaylistData> {
  $$PlaylistTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlaylistTrackTable, List<PlaylistTrackData>>
  _playlistTrackRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.playlistTrack,
    aliasName: $_aliasNameGenerator(
      db.playlist.id,
      db.playlistTrack.playlistId,
    ),
  );

  $$PlaylistTrackTableProcessedTableManager get playlistTrackRefs {
    final manager = $$PlaylistTrackTableTableManager(
      $_db,
      $_db.playlistTrack,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_playlistTrackRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FavoritePlaylistTable, List<FavoritePlaylistData>>
  _favoritePlaylistRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.favoritePlaylist,
    aliasName: $_aliasNameGenerator(
      db.playlist.id,
      db.favoritePlaylist.playlistId,
    ),
  );

  $$FavoritePlaylistTableProcessedTableManager get favoritePlaylistRefs {
    final manager = $$FavoritePlaylistTableTableManager(
      $_db,
      $_db.favoritePlaylist,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _favoritePlaylistRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlaylistTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistTable> {
  $$PlaylistTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> playlistTrackRefs(
    Expression<bool> Function($$PlaylistTrackTableFilterComposer f) f,
  ) {
    final $$PlaylistTrackTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playlistTrack,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTrackTableFilterComposer(
            $db: $db,
            $table: $db.playlistTrack,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> favoritePlaylistRefs(
    Expression<bool> Function($$FavoritePlaylistTableFilterComposer f) f,
  ) {
    final $$FavoritePlaylistTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favoritePlaylist,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritePlaylistTableFilterComposer(
            $db: $db,
            $table: $db.favoritePlaylist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlaylistTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistTable> {
  $$PlaylistTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlaylistTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistTable> {
  $$PlaylistTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  Expression<T> playlistTrackRefs<T extends Object>(
    Expression<T> Function($$PlaylistTrackTableAnnotationComposer a) f,
  ) {
    final $$PlaylistTrackTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playlistTrack,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTrackTableAnnotationComposer(
            $db: $db,
            $table: $db.playlistTrack,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> favoritePlaylistRefs<T extends Object>(
    Expression<T> Function($$FavoritePlaylistTableAnnotationComposer a) f,
  ) {
    final $$FavoritePlaylistTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favoritePlaylist,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritePlaylistTableAnnotationComposer(
            $db: $db,
            $table: $db.favoritePlaylist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlaylistTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlaylistTable,
          PlaylistData,
          $$PlaylistTableFilterComposer,
          $$PlaylistTableOrderingComposer,
          $$PlaylistTableAnnotationComposer,
          $$PlaylistTableCreateCompanionBuilder,
          $$PlaylistTableUpdateCompanionBuilder,
          (PlaylistData, $$PlaylistTableReferences),
          PlaylistData,
          PrefetchHooks Function({
            bool playlistTrackRefs,
            bool favoritePlaylistRefs,
          })
        > {
  $$PlaylistTableTableManager(_$AppDatabase db, $PlaylistTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
              }) => PlaylistCompanion(
                id: id,
                name: name,
                imagePath: imagePath,
                createdTime: createdTime,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
              }) => PlaylistCompanion.insert(
                id: id,
                name: name,
                imagePath: imagePath,
                createdTime: createdTime,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaylistTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({playlistTrackRefs = false, favoritePlaylistRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (playlistTrackRefs) db.playlistTrack,
                    if (favoritePlaylistRefs) db.favoritePlaylist,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (playlistTrackRefs)
                        await $_getPrefetchedData<
                          PlaylistData,
                          $PlaylistTable,
                          PlaylistTrackData
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistTableReferences
                              ._playlistTrackRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistTableReferences(
                                db,
                                table,
                                p0,
                              ).playlistTrackRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (favoritePlaylistRefs)
                        await $_getPrefetchedData<
                          PlaylistData,
                          $PlaylistTable,
                          FavoritePlaylistData
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistTableReferences
                              ._favoritePlaylistRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistTableReferences(
                                db,
                                table,
                                p0,
                              ).favoritePlaylistRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PlaylistTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlaylistTable,
      PlaylistData,
      $$PlaylistTableFilterComposer,
      $$PlaylistTableOrderingComposer,
      $$PlaylistTableAnnotationComposer,
      $$PlaylistTableCreateCompanionBuilder,
      $$PlaylistTableUpdateCompanionBuilder,
      (PlaylistData, $$PlaylistTableReferences),
      PlaylistData,
      PrefetchHooks Function({
        bool playlistTrackRefs,
        bool favoritePlaylistRefs,
      })
    >;
typedef $$PlaylistTrackTableCreateCompanionBuilder =
    PlaylistTrackCompanion Function({
      required int trackId,
      required int playlistId,
      required int position,
      Value<DateTime> createdTime,
      Value<int> rowid,
    });
typedef $$PlaylistTrackTableUpdateCompanionBuilder =
    PlaylistTrackCompanion Function({
      Value<int> trackId,
      Value<int> playlistId,
      Value<int> position,
      Value<DateTime> createdTime,
      Value<int> rowid,
    });

final class $$PlaylistTrackTableReferences
    extends
        BaseReferences<_$AppDatabase, $PlaylistTrackTable, PlaylistTrackData> {
  $$PlaylistTrackTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TracksTable _trackIdTable(_$AppDatabase db) => db.tracks.createAlias(
    $_aliasNameGenerator(db.playlistTrack.trackId, db.tracks.id),
  );

  $$TracksTableProcessedTableManager get trackId {
    final $_column = $_itemColumn<int>('track_id')!;

    final manager = $$TracksTableTableManager(
      $_db,
      $_db.tracks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_trackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlaylistTable _playlistIdTable(_$AppDatabase db) =>
      db.playlist.createAlias(
        $_aliasNameGenerator(db.playlistTrack.playlistId, db.playlist.id),
      );

  $$PlaylistTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistTableTableManager(
      $_db,
      $_db.playlist,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlaylistTrackTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistTrackTable> {
  $$PlaylistTrackTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  $$TracksTableFilterComposer get trackId {
    final $$TracksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackId,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableFilterComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlaylistTableFilterComposer get playlistId {
    final $$PlaylistTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTableFilterComposer(
            $db: $db,
            $table: $db.playlist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaylistTrackTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistTrackTable> {
  $$PlaylistTrackTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  $$TracksTableOrderingComposer get trackId {
    final $$TracksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackId,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableOrderingComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlaylistTableOrderingComposer get playlistId {
    final $$PlaylistTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTableOrderingComposer(
            $db: $db,
            $table: $db.playlist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaylistTrackTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistTrackTable> {
  $$PlaylistTrackTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  $$TracksTableAnnotationComposer get trackId {
    final $$TracksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackId,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableAnnotationComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlaylistTableAnnotationComposer get playlistId {
    final $$PlaylistTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTableAnnotationComposer(
            $db: $db,
            $table: $db.playlist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaylistTrackTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlaylistTrackTable,
          PlaylistTrackData,
          $$PlaylistTrackTableFilterComposer,
          $$PlaylistTrackTableOrderingComposer,
          $$PlaylistTrackTableAnnotationComposer,
          $$PlaylistTrackTableCreateCompanionBuilder,
          $$PlaylistTrackTableUpdateCompanionBuilder,
          (PlaylistTrackData, $$PlaylistTrackTableReferences),
          PlaylistTrackData,
          PrefetchHooks Function({bool trackId, bool playlistId})
        > {
  $$PlaylistTrackTableTableManager(_$AppDatabase db, $PlaylistTrackTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistTrackTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistTrackTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistTrackTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> trackId = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaylistTrackCompanion(
                trackId: trackId,
                playlistId: playlistId,
                position: position,
                createdTime: createdTime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int trackId,
                required int playlistId,
                required int position,
                Value<DateTime> createdTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaylistTrackCompanion.insert(
                trackId: trackId,
                playlistId: playlistId,
                position: position,
                createdTime: createdTime,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaylistTrackTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({trackId = false, playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (trackId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.trackId,
                                referencedTable: $$PlaylistTrackTableReferences
                                    ._trackIdTable(db),
                                referencedColumn: $$PlaylistTrackTableReferences
                                    ._trackIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable: $$PlaylistTrackTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn: $$PlaylistTrackTableReferences
                                    ._playlistIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlaylistTrackTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlaylistTrackTable,
      PlaylistTrackData,
      $$PlaylistTrackTableFilterComposer,
      $$PlaylistTrackTableOrderingComposer,
      $$PlaylistTrackTableAnnotationComposer,
      $$PlaylistTrackTableCreateCompanionBuilder,
      $$PlaylistTrackTableUpdateCompanionBuilder,
      (PlaylistTrackData, $$PlaylistTrackTableReferences),
      PlaylistTrackData,
      PrefetchHooks Function({bool trackId, bool playlistId})
    >;
typedef $$PictureTableCreateCompanionBuilder =
    PictureCompanion Function({
      required String trackPath,
      Value<Uint8List?> bytes,
      Value<String?> mimeType,
      Value<String?> pictureType,
      Value<int> rowid,
    });
typedef $$PictureTableUpdateCompanionBuilder =
    PictureCompanion Function({
      Value<String> trackPath,
      Value<Uint8List?> bytes,
      Value<String?> mimeType,
      Value<String?> pictureType,
      Value<int> rowid,
    });

final class $$PictureTableReferences
    extends BaseReferences<_$AppDatabase, $PictureTable, PictureData> {
  $$PictureTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TracksTable _trackPathTable(_$AppDatabase db) =>
      db.tracks.createAlias(
        $_aliasNameGenerator(db.picture.trackPath, db.tracks.filePath),
      );

  $$TracksTableProcessedTableManager get trackPath {
    final $_column = $_itemColumn<String>('track_path')!;

    final manager = $$TracksTableTableManager(
      $_db,
      $_db.tracks,
    ).filter((f) => f.filePath.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_trackPathTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PictureTableFilterComposer
    extends Composer<_$AppDatabase, $PictureTable> {
  $$PictureTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pictureType => $composableBuilder(
    column: $table.pictureType,
    builder: (column) => ColumnFilters(column),
  );

  $$TracksTableFilterComposer get trackPath {
    final $$TracksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackPath,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.filePath,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableFilterComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PictureTableOrderingComposer
    extends Composer<_$AppDatabase, $PictureTable> {
  $$PictureTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pictureType => $composableBuilder(
    column: $table.pictureType,
    builder: (column) => ColumnOrderings(column),
  );

  $$TracksTableOrderingComposer get trackPath {
    final $$TracksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackPath,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.filePath,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableOrderingComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PictureTableAnnotationComposer
    extends Composer<_$AppDatabase, $PictureTable> {
  $$PictureTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<Uint8List> get bytes =>
      $composableBuilder(column: $table.bytes, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<String> get pictureType => $composableBuilder(
    column: $table.pictureType,
    builder: (column) => column,
  );

  $$TracksTableAnnotationComposer get trackPath {
    final $$TracksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackPath,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.filePath,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableAnnotationComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PictureTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PictureTable,
          PictureData,
          $$PictureTableFilterComposer,
          $$PictureTableOrderingComposer,
          $$PictureTableAnnotationComposer,
          $$PictureTableCreateCompanionBuilder,
          $$PictureTableUpdateCompanionBuilder,
          (PictureData, $$PictureTableReferences),
          PictureData,
          PrefetchHooks Function({bool trackPath})
        > {
  $$PictureTableTableManager(_$AppDatabase db, $PictureTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PictureTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PictureTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PictureTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> trackPath = const Value.absent(),
                Value<Uint8List?> bytes = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<String?> pictureType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PictureCompanion(
                trackPath: trackPath,
                bytes: bytes,
                mimeType: mimeType,
                pictureType: pictureType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String trackPath,
                Value<Uint8List?> bytes = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<String?> pictureType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PictureCompanion.insert(
                trackPath: trackPath,
                bytes: bytes,
                mimeType: mimeType,
                pictureType: pictureType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PictureTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({trackPath = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (trackPath) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.trackPath,
                                referencedTable: $$PictureTableReferences
                                    ._trackPathTable(db),
                                referencedColumn: $$PictureTableReferences
                                    ._trackPathTable(db)
                                    .filePath,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PictureTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PictureTable,
      PictureData,
      $$PictureTableFilterComposer,
      $$PictureTableOrderingComposer,
      $$PictureTableAnnotationComposer,
      $$PictureTableCreateCompanionBuilder,
      $$PictureTableUpdateCompanionBuilder,
      (PictureData, $$PictureTableReferences),
      PictureData,
      PrefetchHooks Function({bool trackPath})
    >;
typedef $$FavoriteTrackTableCreateCompanionBuilder =
    FavoriteTrackCompanion Function({
      required int trackId,
      Value<DateTime> createdTime,
      Value<int> rowid,
    });
typedef $$FavoriteTrackTableUpdateCompanionBuilder =
    FavoriteTrackCompanion Function({
      Value<int> trackId,
      Value<DateTime> createdTime,
      Value<int> rowid,
    });

final class $$FavoriteTrackTableReferences
    extends
        BaseReferences<_$AppDatabase, $FavoriteTrackTable, FavoriteTrackData> {
  $$FavoriteTrackTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TracksTable _trackIdTable(_$AppDatabase db) => db.tracks.createAlias(
    $_aliasNameGenerator(db.favoriteTrack.trackId, db.tracks.id),
  );

  $$TracksTableProcessedTableManager get trackId {
    final $_column = $_itemColumn<int>('track_id')!;

    final manager = $$TracksTableTableManager(
      $_db,
      $_db.tracks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_trackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavoriteTrackTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteTrackTable> {
  $$FavoriteTrackTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  $$TracksTableFilterComposer get trackId {
    final $$TracksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackId,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableFilterComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoriteTrackTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteTrackTable> {
  $$FavoriteTrackTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  $$TracksTableOrderingComposer get trackId {
    final $$TracksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackId,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableOrderingComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoriteTrackTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteTrackTable> {
  $$FavoriteTrackTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  $$TracksTableAnnotationComposer get trackId {
    final $$TracksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trackId,
      referencedTable: $db.tracks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TracksTableAnnotationComposer(
            $db: $db,
            $table: $db.tracks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoriteTrackTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteTrackTable,
          FavoriteTrackData,
          $$FavoriteTrackTableFilterComposer,
          $$FavoriteTrackTableOrderingComposer,
          $$FavoriteTrackTableAnnotationComposer,
          $$FavoriteTrackTableCreateCompanionBuilder,
          $$FavoriteTrackTableUpdateCompanionBuilder,
          (FavoriteTrackData, $$FavoriteTrackTableReferences),
          FavoriteTrackData,
          PrefetchHooks Function({bool trackId})
        > {
  $$FavoriteTrackTableTableManager(_$AppDatabase db, $FavoriteTrackTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteTrackTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteTrackTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteTrackTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> trackId = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteTrackCompanion(
                trackId: trackId,
                createdTime: createdTime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int trackId,
                Value<DateTime> createdTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteTrackCompanion.insert(
                trackId: trackId,
                createdTime: createdTime,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FavoriteTrackTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({trackId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (trackId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.trackId,
                                referencedTable: $$FavoriteTrackTableReferences
                                    ._trackIdTable(db),
                                referencedColumn: $$FavoriteTrackTableReferences
                                    ._trackIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FavoriteTrackTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteTrackTable,
      FavoriteTrackData,
      $$FavoriteTrackTableFilterComposer,
      $$FavoriteTrackTableOrderingComposer,
      $$FavoriteTrackTableAnnotationComposer,
      $$FavoriteTrackTableCreateCompanionBuilder,
      $$FavoriteTrackTableUpdateCompanionBuilder,
      (FavoriteTrackData, $$FavoriteTrackTableReferences),
      FavoriteTrackData,
      PrefetchHooks Function({bool trackId})
    >;
typedef $$FavoritePlaylistTableCreateCompanionBuilder =
    FavoritePlaylistCompanion Function({
      required int playlistId,
      Value<DateTime> createdTime,
      Value<int> rowid,
    });
typedef $$FavoritePlaylistTableUpdateCompanionBuilder =
    FavoritePlaylistCompanion Function({
      Value<int> playlistId,
      Value<DateTime> createdTime,
      Value<int> rowid,
    });

final class $$FavoritePlaylistTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FavoritePlaylistTable,
          FavoritePlaylistData
        > {
  $$FavoritePlaylistTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlaylistTable _playlistIdTable(_$AppDatabase db) =>
      db.playlist.createAlias(
        $_aliasNameGenerator(db.favoritePlaylist.playlistId, db.playlist.id),
      );

  $$PlaylistTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistTableTableManager(
      $_db,
      $_db.playlist,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavoritePlaylistTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritePlaylistTable> {
  $$FavoritePlaylistTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistTableFilterComposer get playlistId {
    final $$PlaylistTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTableFilterComposer(
            $db: $db,
            $table: $db.playlist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritePlaylistTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritePlaylistTable> {
  $$FavoritePlaylistTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistTableOrderingComposer get playlistId {
    final $$PlaylistTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTableOrderingComposer(
            $db: $db,
            $table: $db.playlist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritePlaylistTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritePlaylistTable> {
  $$FavoritePlaylistTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
    column: $table.createdTime,
    builder: (column) => column,
  );

  $$PlaylistTableAnnotationComposer get playlistId {
    final $$PlaylistTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistTableAnnotationComposer(
            $db: $db,
            $table: $db.playlist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritePlaylistTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritePlaylistTable,
          FavoritePlaylistData,
          $$FavoritePlaylistTableFilterComposer,
          $$FavoritePlaylistTableOrderingComposer,
          $$FavoritePlaylistTableAnnotationComposer,
          $$FavoritePlaylistTableCreateCompanionBuilder,
          $$FavoritePlaylistTableUpdateCompanionBuilder,
          (FavoritePlaylistData, $$FavoritePlaylistTableReferences),
          FavoritePlaylistData,
          PrefetchHooks Function({bool playlistId})
        > {
  $$FavoritePlaylistTableTableManager(
    _$AppDatabase db,
    $FavoritePlaylistTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritePlaylistTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritePlaylistTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritePlaylistTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> playlistId = const Value.absent(),
                Value<DateTime> createdTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritePlaylistCompanion(
                playlistId: playlistId,
                createdTime: createdTime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int playlistId,
                Value<DateTime> createdTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritePlaylistCompanion.insert(
                playlistId: playlistId,
                createdTime: createdTime,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FavoritePlaylistTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable:
                                    $$FavoritePlaylistTableReferences
                                        ._playlistIdTable(db),
                                referencedColumn:
                                    $$FavoritePlaylistTableReferences
                                        ._playlistIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FavoritePlaylistTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritePlaylistTable,
      FavoritePlaylistData,
      $$FavoritePlaylistTableFilterComposer,
      $$FavoritePlaylistTableOrderingComposer,
      $$FavoritePlaylistTableAnnotationComposer,
      $$FavoritePlaylistTableCreateCompanionBuilder,
      $$FavoritePlaylistTableUpdateCompanionBuilder,
      (FavoritePlaylistData, $$FavoritePlaylistTableReferences),
      FavoritePlaylistData,
      PrefetchHooks Function({bool playlistId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TracksTableTableManager get tracks =>
      $$TracksTableTableManager(_db, _db.tracks);
  $$ListenedTrackTableTableManager get listenedTrack =>
      $$ListenedTrackTableTableManager(_db, _db.listenedTrack);
  $$PlaylistTableTableManager get playlist =>
      $$PlaylistTableTableManager(_db, _db.playlist);
  $$PlaylistTrackTableTableManager get playlistTrack =>
      $$PlaylistTrackTableTableManager(_db, _db.playlistTrack);
  $$PictureTableTableManager get picture =>
      $$PictureTableTableManager(_db, _db.picture);
  $$FavoriteTrackTableTableManager get favoriteTrack =>
      $$FavoriteTrackTableTableManager(_db, _db.favoriteTrack);
  $$FavoritePlaylistTableTableManager get favoritePlaylist =>
      $$FavoritePlaylistTableTableManager(_db, _db.favoritePlaylist);
}
