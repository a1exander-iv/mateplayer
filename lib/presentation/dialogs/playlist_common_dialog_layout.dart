import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/playlist/playlist_cubit.dart';

import 'package:mate_player/presentation/enums/playlist_dialog_type_enum.dart';

class PlaylistCommonDialogLayout extends StatelessWidget {
  const PlaylistCommonDialogLayout({
    super.key,
    required this.titleText,
    required this.child,
    required this.playlistDialogType,
    required this.nameGlobalKey,
    this.widthMultiplierDesktopScreen = 0.5,
    this.widthMultiplierMobileScreen = 0.5,
    this.heightMultiplierDesktopScreen = 0.5,
    this.heightMultiplierMobileScreen = 0.5,
  });
  final String titleText;
  final Widget child;

  final double widthMultiplierDesktopScreen;
  final double widthMultiplierMobileScreen;

  final double heightMultiplierDesktopScreen;
  final double heightMultiplierMobileScreen;

  final PlaylistDialogType playlistDialogType;

  final GlobalKey<FormState> nameGlobalKey;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(builder: (context, constraints) {
      double containerWidth = constraints.maxWidth * 0.5;
      double containerHeight = constraints.maxHeight * 0.5;
      final screenSize = MediaQuery.of(context).size;
      if (screenSize.width > 600) {
        containerWidth = screenSize.width * widthMultiplierDesktopScreen;
      } else {
        containerWidth = screenSize.width * widthMultiplierMobileScreen;
      }

      if (constraints.maxHeight > 600) {
        containerHeight = constraints.maxHeight * heightMultiplierDesktopScreen;
      } else {
        containerHeight = constraints.maxHeight * heightMultiplierMobileScreen;
      }

      return AlertDialog(
          scrollable: true,
          contentPadding:
              const EdgeInsets.only(left: 24, right: 12, top: 24, bottom: 12),
          actionsPadding:
              const EdgeInsets.only(left: 24, right: 12, bottom: 24),
          title: Text(
            titleText,
            style: textTheme.headlineMedium,
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.playlistCommonDialogCancelButton),
            ),
            Builder(builder: (context) {
              if (playlistDialogType == PlaylistDialogType.create) {
                return FilledButton(
                    onPressed: () {
                      context.read<PlaylistCubit>().createPlaylist();
                      GoRouter.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context)!.playlistCommonDialogCreateButton));
              } else {
                return FilledButton(
                    onPressed: () {
                      if (nameGlobalKey.currentState!.validate()) {
                        context.read<PlaylistCubit>().editPlaylist();
                        GoRouter.of(context).pop();
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.playlistCommonDialogEditButton));
              }
            }),
          ],
          content: SizedBox(
            width: containerWidth,
            height: containerHeight,
            child: child,
          ));
    });
  }
}
