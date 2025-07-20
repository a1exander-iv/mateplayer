import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/playlist/playlist_cubit.dart';
import 'package:mate_player/presentation/dialogs/playlist_common_dialog_body.dart';
import 'package:mate_player/presentation/dialogs/playlist_common_dialog_layout.dart';

import 'package:mate_player/presentation/enums/playlist_dialog_type_enum.dart';

void showPlaylistCreationDialog(
  BuildContext context,
) {
  PlaylistCubit playlistCubit = context.read<PlaylistCubit>();
  playlistCubit.clear();

  int totalPlaylists = 0;
  Future.sync(() async {
    totalPlaylists = await playlistCubit.getTotalPlaylists();
  });
  
  showDialog(
      context: context,
      builder: (dialogContext) {
        TextEditingController playlistNameController = TextEditingController();
        String defaultPlaylistName =
            "${AppLocalizations.of(context)!.playlistDefaultName} ${totalPlaylists + 1}";
        playlistCubit.playlistName = defaultPlaylistName;
        playlistNameController.addListener(() {
          if (playlistNameController.text.isEmpty) {
            playlistCubit.playlistName = defaultPlaylistName;
          } else {
            playlistCubit.playlistName = playlistNameController.text;
          }
        });

        final formKey = GlobalKey<FormState>();
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.watch<PlaylistCubit>()),
          ],
          child: PlaylistCommonDialogLayout(
            widthMultiplierDesktopScreen: 0.4,
            widthMultiplierMobileScreen: 0.6,
            heightMultiplierDesktopScreen: 0.3,
            heightMultiplierMobileScreen: 0.6,
            playlistDialogType: PlaylistDialogType.create,
            titleText: AppLocalizations.of(context)!.playlistCreationDialogTitle,
            nameGlobalKey: formKey,
            child: PlaylistCommonDialogBody(
              nameGlobalKey: formKey,
              playlistDialogType: PlaylistDialogType.create,
              playlistNameController: playlistNameController,
            ),
          ),
        );
      });
}
