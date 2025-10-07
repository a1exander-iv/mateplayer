import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/domain/models/track_model.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:mate_player/presentation/cubits/picture/pictures_cubit.dart';
import 'package:mate_player/presentation/cubits/player/player_cubit.dart';
import 'package:mate_player/shared/utils/parse_track_image.dart';
import 'package:mate_player/shared/utils/path_parser_from_source.dart';
import 'package:mate_player/shared/utils/seconds_to_string.dart';
import 'package:mate_player/shared/widgets/image_placeholder.dart';
import 'package:mate_player/shared/widgets/tile_menu.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TrackGridTile extends StatelessWidget {
  final TrackModel track;
  final Function()? onTap;
  final Widget menu;
  const TrackGridTile({
    super.key,
    required this.onTap,
    required this.track,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<PlayerCubit, PlayerCubitState>(
      builder: (context, state) {
        bool isPlaying = false;
        Color? gridTileColor;

        if (pathFromPlayerSource(source: state.source) == track.filePath &&
            (state.audioPlayerState == PlayerState.playing ||
                state.audioPlayerState == PlayerState.paused)) {
          isPlaying = true;
        }

        if (track.playbackError) {
          gridTileColor = colorScheme.errorContainer;
        } else if (isPlaying) {
          gridTileColor = colorScheme.secondaryContainer;
        }

        return Card(
          color: gridTileColor,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    BlocBuilder<PicturesCubit, PicturesState>(
                      builder: (context, state) {
                        String? imagePath = state is PicturesLoadComplete
                            ? parseTrackImagePath(
                                state.picturesDataMap,
                                track.filePath,
                              )
                            : null;
                        return ImagePlaceholder(
                          cachedHeight: 200,
                          cachedWidth: 220,
                          imagePath: imagePath,
                          imageFit: BoxFit.fill,
                          icon: Icons.music_note,
                          iconSize: 64,
                          height: 200,
                          width: 220,
                          backgroundColor: Colors.transparent,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            track.trackTitle != null &&
                                    track.trackTitle!.isNotEmpty
                                ? track.trackTitle!
                                : track.fileBaseName,
                            style: textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            track.trackArtist != null &&
                                    track.trackArtist!.isNotEmpty
                                ? track.trackArtist!
                                : AppLocalizations.of(context)!.unknownArtist,
                            style: textTheme.titleSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Material(
                  color: Colors.transparent,
                  animateColor: true,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: onTap,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(
                            builder: (context) {
                              if (track.trackDurationInMilliseconds != null) {
                                return Text(
                                  secondsToString(
                                    Duration(
                                      milliseconds: track
                                          .trackDurationInMilliseconds!
                                          .toInt(),
                                    ).inSeconds,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                          menu,
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, favoriteState) {
                        final bool favorite =
                            favoriteState is FavoriteInfoLoadComplete &&
                                favoriteState.tracksFavoriteMap.containsKey(
                                  track.id,
                                )
                            ? true
                            : false;
                        if (favorite) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              color: colorScheme.primary,
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TrackGridList extends StatelessWidget {
  const TrackGridList({super.key, required this.trackList});
  final List<TrackModel> trackList;

  @override
  Widget build(BuildContext context) {
    return GridList(
      itemCount: trackList.length,
      itemBuilder: (context, index) {
        final track = trackList[index];
        return TrackGridTile(
          menu: TrackTileMenu(track: track, menuIcon: Icons.more_horiz),
          onTap: () async {
            context.read<PlayerCubit>().mainListTilePlay(
              track: track,
              audioList: trackList,
            );
          },
          track: track,
        );
      },
    );
  }
}

class PlaylistGridList extends StatelessWidget {
  const PlaylistGridList({
    super.key,
    required this.playlist,
    required this.playlistId,
  });

  final List<TrackModel> playlist;
  final int playlistId;
  @override
  Widget build(BuildContext context) {
    PlayerCubit playerCubit = context.read<PlayerCubit>();
    return GridList(
      itemCount: playlist.length,
      itemBuilder: (context, index) {
        return TrackGridTile(
          onTap: () {
            playerCubit.playlistTilePlay(
              track: playlist[index],
              audioList: playlist,
              playlistId: playlistId,
            );
          },
          track: playlist[index],
          menu: PlaylistTrackTileMenu(
            track: playlist[index],
            playlistId: playlistId,
            menuIcon: Icons.more_horiz,
          ),
        );
      },
    );
  }
}

class GridList extends StatelessWidget {
  const GridList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        maxCrossAxisExtent: 200,
        mainAxisExtent: 300,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}

class SkeletonGridList extends StatelessWidget {
  const SkeletonGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      child: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 300,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 32,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsetsGeometry.only(bottom: 8),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 200, width: 220,),
                      Padding(
                        padding: EdgeInsetsGeometry.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Text("__________"), Text("_______")],
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              secondsToString(250),
                              textAlign: TextAlign.center,
                            ),

                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_horiz),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
