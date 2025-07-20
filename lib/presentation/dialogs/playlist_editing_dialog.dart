import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/domain/models/playlist_model.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/playlist/playlist_cubit.dart';
import 'package:mate_player/presentation/dialogs/playlist_common_dialog_body.dart';
import 'package:mate_player/presentation/dialogs/playlist_common_dialog_layout.dart';
import 'package:mate_player/presentation/enums/playlist_dialog_type_enum.dart';

void showPlaylistEditingDialog(
    BuildContext context, int playlistId, List<int> playlistTrackIds) async {
  PlaylistCubit playlistCubit = context.read<PlaylistCubit>()..clear();

  if (playlistCubit.playlistCatalogList != null) {
    PlaylistModel? playlistData = playlistCubit.playlistCatalogList!
        .where((playlist) => playlist.id == playlistId)
        .firstOrNull;
    List<int> trackIdList =
        await playlistCubit.getPlaylistTrackIdsList(playlistId);
    if (playlistData != null) {
      playlistCubit
        ..playlistId = playlistData.id
        ..playlistName = playlistData.name ?? ""
        ..playlistImagePath = playlistData.imagePath
        ..playlistTrackIdList = trackIdList;

      showDialog(
          context: context,
          builder: (dialogContext) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.watch<PlaylistCubit>()),
              ],
              child: Builder(builder: (dialogContext) {
                TextEditingController playlistNameController =
                    TextEditingController();
                playlistNameController.text = playlistData.name ?? "";
                playlistNameController.addListener(() {
                  playlistCubit.playlistName = playlistNameController.text;
                });
                final formKey = GlobalKey<FormState>();
                return PlaylistCommonDialogLayout(
                    titleText: AppLocalizations.of(context)!.playlistEditDialogTitle,
                    playlistDialogType: PlaylistDialogType.edit,
                    widthMultiplierDesktopScreen: 0.4,
                    widthMultiplierMobileScreen: 0.6,
                    heightMultiplierDesktopScreen: 0.3,
                    heightMultiplierMobileScreen: 0.6,
                    nameGlobalKey: formKey,
                    child: PlaylistCommonDialogBody(
                        nameGlobalKey: formKey,
                        playlistDialogType: PlaylistDialogType.edit,
                        playlistNameController: playlistNameController));
              }),
            );
          });
    }
  }
}
