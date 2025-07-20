import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/presentation/cubits/player/player_cubit.dart';

class PlayAndPauseButton extends StatelessWidget {
  const PlayAndPauseButton({super.key, required this.onPressed, this.iconSize});

  final void Function() onPressed;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<PlayerCubit, PlayerCubitState>(
      builder: (context, state) {
        switch (state.audioPlayerState) {
          case PlayerState.disposed || PlayerState.stopped:
            return IconButton.filled(
                iconSize: iconSize,
                onPressed: onPressed,
                icon: Icon(
                  Icons.play_arrow,
                  color: colorScheme.onPrimary,
                ));
          case PlayerState.playing:
            return IconButton.filled(
                iconSize: iconSize,
                onPressed: onPressed,
                icon: Icon(
                  Icons.pause,
                  color: colorScheme.onPrimary,
                ));
          case PlayerState.paused:
            return IconButton.filled(
                iconSize: iconSize,
                onPressed: onPressed,
                icon: Icon(
                  Icons.play_arrow,
                  color: colorScheme.onPrimary,
                ));
          default:
            return IconButton.filled(
                iconSize: iconSize,
                onPressed: null,
                icon: Icon(
                  Icons.play_arrow,
                  color: colorScheme.onPrimary,
                ));
        }
      },
    );
  }
}

class PlaylistPlayAndPause extends StatelessWidget {
  const PlaylistPlayAndPause(
      {super.key,
      required this.onPressed,
      required this.playlistId,
      this.iconSize});

  final void Function() onPressed;
  final int playlistId;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<PlayerCubit, PlayerCubitState>(
      builder: (context, state) {
        switch (state.audioPlayerState) {
          case PlayerState.disposed || PlayerState.stopped:
            return IconButton.filled(
                iconSize: iconSize,
                onPressed: onPressed,
                icon: Icon(
                  Icons.play_arrow,
                  color: colorScheme.onPrimary,
                ));
          case PlayerState.playing:
            if (state.currentPlayingPlaylistId != playlistId) {
              return IconButton.filled(
                  iconSize: iconSize,
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.play_arrow,
                    color: colorScheme.onPrimary,
                  ));
            }
            return IconButton.filled(
                iconSize: iconSize,
                onPressed: onPressed,
                icon: Icon(
                  Icons.pause,
                  color: colorScheme.onPrimary,
                ));
          case PlayerState.paused:
            return IconButton.filled(
                iconSize: iconSize,
                onPressed: onPressed,
                icon: Icon(
                  Icons.play_arrow,
                  color: colorScheme.onPrimary,
                ));
          default:
            return IconButton.filled(
                iconSize: iconSize,
                onPressed: null,
                icon: Icon(
                  Icons.play_arrow,
                  color: colorScheme.onPrimary,
                ));
        }
      },
    );
  }
}
