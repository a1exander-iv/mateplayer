import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/playlist/playlist_cubit.dart';
import 'package:mate_player/presentation/cubits/playlist_screen/playlist_screen_cubit.dart';
import 'package:mate_player/presentation/dialogs/playlist_editing_dialog.dart';
import 'package:mate_player/presentation/dialogs/reorder_playlist.dart';
import 'package:mate_player/shared/widgets/top_app_bar.dart';

enum EditPlaylistPopupValues { reorderPlaylist, editPlaylistInfo }

class PlaylistScreenAppBar extends StatelessWidget {
  const PlaylistScreenAppBar({super.key, required this.playlistId});

  final int playlistId;

  @override
  Widget build(BuildContext context) {
    return TopAppBar(
      actions: [
        PlaylistEditMenuButton(
          playlistId: playlistId,
        ),
        IconButton(
            tooltip: AppLocalizations.of(context)!.deletePlaylistIconButtonTooltip,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(AppLocalizations.of(context)!.deletePlaylistDialogTitle),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  GoRouter.of(context).pop();
                                },
                                child: Text(AppLocalizations.of(context)!.deletePlaylistCancelButton)),
                            TextButton(
                                onPressed: () async {
                                  context
                                      .read<PlaylistCubit>()
                                      .deletePlaylist(playlistId);
                                  GoRouter.of(context).go("/");
                                },
                                child: Text(AppLocalizations.of(context)!.deletePlaylistConfirmButton)),
                          ],
                        )
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.delete)),
      ],
    );
  }
}

class PlaylistEditMenuButton extends StatefulWidget {
  const PlaylistEditMenuButton({super.key, required this.playlistId});

  final int playlistId;
  @override
  State<PlaylistEditMenuButton> createState() => _PlaylistEditMenuButtonState();
}

class _PlaylistEditMenuButtonState extends State<PlaylistEditMenuButton> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return BlocBuilder<PlaylistScreenCubit, PlaylistScreenState>(
            builder: (context, state) {
              bool isSelected = true;
              if (state is PlaylistLoadComplete) {
                isSelected = true;
              } else {
                isSelected = false;
              }

              return IconButton(
                onPressed: isSelected
                    ? () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      }
                    : null,
                icon: const Icon(Icons.edit),
                tooltip: AppLocalizations.of(context)!.playlistEditMenuButtonTooltip,
              );
            },
          );
        },
        menuChildren: <MenuItemButton>[
          MenuItemButton(
            onPressed: () async {
              showReorderPlaylistDialog(context);
            },
            leadingIcon: Icon(Icons.reorder),
            child: Text(AppLocalizations.of(context)!.reorderPlaylistMenuItemButton),
          ),
          MenuItemButton(
            onPressed: () async {
              List<int> playlistTrackIdsList = await context
                  .read<PlaylistCubit>()
                  .getPlaylistTrackIdsList(widget.playlistId);
              showPlaylistEditingDialog(
                  context, widget.playlistId, playlistTrackIdsList);
            },
            leadingIcon: Icon(Icons.edit_document),
            child: Text(AppLocalizations.of(context)!.editPlaylistMenuItemButton),
          )
        ]);
  }
}
