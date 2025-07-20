import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mate_player/domain/models/track_model.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/picture/pictures_cubit.dart';
import 'package:mate_player/presentation/cubits/player/player_cubit.dart';
import 'package:mate_player/presentation/cubits/playlist/playlist_cubit.dart';
import 'package:mate_player/presentation/cubits/playlist_screen/playlist_screen_cubit.dart';
import 'package:mate_player/presentation/widgets/track_tile.dart'
    show ReorderableTrackTile;
import 'package:mate_player/shared/utils/parse_track_image.dart';
import 'package:mate_player/shared/widgets/top_app_bar.dart';

Future<void> showReorderPlaylistDialog(
  BuildContext context,
) async {
  ColorScheme? colorScheme = Theme.of(context).colorScheme;
  PlaylistCubit playlistCubit = context.read<PlaylistCubit>();
  showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.watch<PlaylistScreenCubit>(),
          child: Dialog.fullscreen(
            key: UniqueKey(),
            backgroundColor: colorScheme.surface,
            child: BlocBuilder<PlaylistScreenCubit, PlaylistScreenState>(
              builder: (context, state) {
                if (state is PlaylistLoadComplete) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                              child: TopAppBar(
                            title: Text(
                              AppLocalizations.of(context)!.reorderPlaylistDialogTitle,
                            ),
                          )),
                          SliverPadding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              sliver: SliverPadding(
                                  padding: EdgeInsets.only(bottom: 40),
                                  sliver: ReorderableList(
                                    playlistId: state.playlistData.id,
                                    playlistTrackList: state.playlistTrackList,
                                  )))
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(color: colorScheme.surface),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    GoRouter.of(dialogContext).pop();
                                  },
                                  child: Text(AppLocalizations.of(context)!.reorderPlaylistCancel)),
                              SizedBox(
                                width: 8,
                              ),
                              FilledButton(
                                  onPressed: () {
                                    context
                                        .read<PlaylistCubit>()
                                        .saveNewPlaylistTrackIdsList(
                                            playlistId: state.playlistData.id);
                                    context
                                        .read<PlayerCubit>()
                                        .reorderSequenceListByPlaylistIdsList(
                                            playlistIdsList: playlistCubit
                                                .playlistTrackIdList!);

                                    GoRouter.of(dialogContext).pop();
                                  },
                                  child: Text(AppLocalizations.of(context)!.reorderPlaylistSave)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        );
      });
}

class ReorderableList extends StatefulWidget {
  const ReorderableList(
      {super.key, required this.playlistTrackList, required this.playlistId});
  final List<TrackModel> playlistTrackList;
  final int playlistId;
  @override
  State<ReorderableList> createState() => _ReorderableListState();
}

class _ReorderableListState extends State<ReorderableList> {
  late List<TrackModel> playlistTrackList;
  late PlaylistCubit playlistCubit;
  @override
  void initState() {
    playlistTrackList = List.from(widget.playlistTrackList);
    playlistCubit = context.read<PlaylistCubit>();
    playlistCubit.playlistTrackIdList =
        playlistTrackList.map((track) => track.id).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverReorderableList(
        itemBuilder: (context, index) {
          return ReorderableDragStartListener(
            index: index,
            key: Key('$index'),
            child: Material(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: BlocBuilder<PicturesCubit, PicturesState>(
                builder: (context, state) {
                  Uint8List? imageBytes = state is PicturesLoadComplete
                      ? parseTrackImage(state.picturesDataMap,
                          playlistTrackList[index].filePath)
                      : null;
                  return ReorderableTrackTile(
                      trackImage: imageBytes,
                      index: index + 1,
                      track: playlistTrackList[index]);
                },
              ),
            )),
          );
        },
        itemCount: playlistTrackList.length,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final TrackModel track = playlistTrackList.removeAt(oldIndex);
            playlistTrackList.insert(newIndex, track);

            final List<int> trackIdsList =
                playlistTrackList.map((track) => track.id).toList();
            playlistCubit.playlistTrackIdList = trackIdsList;

          });
        });
  }

  @override
  void dispose() {
    playlistCubit.clear();
    super.dispose();
  }
}
