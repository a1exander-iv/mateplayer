import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:mate_player/domain/models/track_model.dart';
import 'package:mate_player/shared/resources/asset_path.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' show getTemporaryDirectory;

class AudioPlayerRepository {
  AudioPlayerRepository() {
    if (Platform.isAndroid) {
      initAudioPlayerHandler();
      audioPlayer.positionUpdater = TimerPositionUpdater(
          getPosition: audioPlayer.getCurrentPosition,
          interval: const Duration(milliseconds: 100));
    }
  }

  void initAudioPlayerHandler() async {
    _audioPlayerHandler = await AudioService.init(
      builder: () => AudioPlayerHandler(_audioPlayer),
      config: AudioServiceConfig(
          androidNotificationChannelId: 'app.mateplayer.oss.channel.audio',
          androidNotificationChannelName: 'Music playback',
          androidShowNotificationBadge: true,
          androidNotificationOngoing: false,
          androidStopForegroundOnPause: false),
    );
  }

  final AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayerHandler? _audioPlayerHandler;

  AudioPlayer get audioPlayer => _audioPlayer;

  Future<void> play(TrackModel track, Uint8List? trackImage) async {
    if (Platform.isAndroid) {
      _audioPlayerHandler!.playMediaItem(MediaItem(
          album: track.album,
          id: track.filePath,
          title: track.trackTitle ?? track.fileBaseName,
          artist: track.trackArtist,
          artUri:
              await _saveImageAsTempFileAndGetUri(trackImage, track.filePath),
          duration: track.trackDurationInMilliseconds != null
              ? Duration(
                  milliseconds: track.trackDurationInMilliseconds!.toInt())
              : null));
    }
    await _audioPlayer.play(DeviceFileSource(track.filePath));
  }

  Future<void> pause() async {
    if (Platform.isAndroid) {
      await _audioPlayerHandler?.pause();
      return;
    }
    await _audioPlayer.pause();
  }

  Future<void> resume() async {
    if (Platform.isAndroid) {
      await _audioPlayerHandler?.resume();
      return;
    }
    await _audioPlayer.resume();
  }

  Future<void> stop() async {
    if (Platform.isAndroid) {
      await _audioPlayerHandler?.stop();
      return;
    }

    await _audioPlayer.stop();
  }

  Future<void> dispose() async {
    if (Platform.isAndroid) {
      await _audioPlayerHandler?.dispose();
      return;
    }
    await _audioPlayer.dispose();
  }

  set setPlayerSource(Source source) {
    _audioPlayer.setSource(source);
  }

  PlayerState get state => _audioPlayer.state;
  Source? get source => _audioPlayer.source;
  Stream<PlayerState> get onPlayerStateChanged =>
      _audioPlayer.onPlayerStateChanged;
  Stream<void> get onPlayerComplete => _audioPlayer.onPlayerComplete;

  Future<Uri> _saveImageAsTempFileAndGetUri(
      Uint8List? imageBytes, String imageFilePath) async {
    final temporaryDirectory = await getTemporaryDirectory();
    const String placeholderFileName = "notification_placeholder";

    File imageNotificationPlaceholderFile =
        File("${temporaryDirectory.path}/$placeholderFileName.jpg");

    if (imageBytes == null) {
      if (!imageNotificationPlaceholderFile.existsSync()) {
        imageNotificationPlaceholderFile =
            File("${temporaryDirectory.path}/$placeholderFileName.jpg");
        await imageNotificationPlaceholderFile.writeAsBytes(
            (await rootBundle.load(AssetPath.imageNotificationPlaceholder))
                .buffer
                .asUint8List());
      }

      return Uri.file(imageNotificationPlaceholderFile.path);
    }

    String filename = p.basenameWithoutExtension(imageFilePath);

    final file = File('${temporaryDirectory.path}/$filename.png');

    if (file.existsSync()) {
      return Uri.file(file.path);
    }

    await file.writeAsBytes(imageBytes);
    return Uri.file(file.path);
  }
}

class AudioPlayerHandler extends BaseAudioHandler {
  final AudioPlayer _player;

  MediaItem? currentMediaItem;

  AudioPlayerHandler(this._player) {
    _player.onPlayerStateChanged.listen((state) {
      playbackState.add(PlaybackState(
        controls: [
          MediaControl.play,
          MediaControl.pause,
        ],
        systemActions: const {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
        },
        androidCompactActionIndices: const [
          0,
          1,
          2,
        ],
        processingState: _getProcessingState(state),
        playing: state == PlayerState.playing,
      ));
    });

    _player.onDurationChanged.listen((duration) {
      mediaItem.add(currentMediaItem?.copyWith(duration: duration));
    });

    _player.onPositionChanged.listen((position) {
      playbackState.add(playbackState.value.copyWith(
        updatePosition: position,
      ));
    });
  }

  AudioProcessingState _getProcessingState(PlayerState state) {
    switch (state) {
      case PlayerState.playing:
        return AudioProcessingState.ready;
      case PlayerState.paused:
        return AudioProcessingState.ready;
      case PlayerState.stopped:
        return AudioProcessingState.idle;
      case PlayerState.completed:
        return AudioProcessingState.completed;
      default:
        return AudioProcessingState.idle;
    }
  }

  @override
  Future<void> play() => _player.resume();

  Future<void> dispose() => _player.dispose();
  Future<void> resume() => _player.resume();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  Future<void> seek(Duration position) async {
    _player.seek(position);
    playbackState.add(playbackState.value.copyWith(
      updatePosition: position,
    ));
  }

  @override
  Future<void> playMediaItem(MediaItem item) async {
    currentMediaItem = item;
    mediaItem.add(currentMediaItem);

    playbackState.add(playbackState.value.copyWith(
      processingState: AudioProcessingState.loading,
    ));
  }

  @override
  Future<void> onTaskRemoved() async {
    await stop();
  }
}
