import 'package:flutter/material.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/dialogs/playlist_creation_dialog.dart';
import 'package:mate_player/shared/utils/folder_selection.dart';


class FloatingAddButton extends StatefulWidget {
  const FloatingAddButton({super.key});

  @override
  State<FloatingAddButton> createState() => _FloatingAddButtonState();
}

class _FloatingAddButtonState extends State<FloatingAddButton> {
  final FocusNode _buttonFocusNode = FocusNode();

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return MenuAnchor(
      style: MenuStyle(
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: WidgetStateProperty.all(colorScheme.tertiaryContainer),
      ),
      menuChildren: [
        SizedBox(
          height: 70,
          child: MenuItemButton(
            leadingIcon: Icon(
              Icons.create_new_folder,
              color: colorScheme.onTertiaryContainer,
            ),
            child: Text(
              AppLocalizations.of(context)!.addAudioFolderMenuItem,
              style: textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.onTertiaryContainer),
            ),
            onPressed: () async {
              await folderSelection(context);
            },
          ),
        ),
        SizedBox(
          height: 70,
          child: MenuItemButton(
            leadingIcon: Icon(
              Icons.my_library_music,
              color: colorScheme.onTertiaryContainer,
            ),
            onPressed: () {
              showPlaylistCreationDialog(context);
            },
            child: Text(
              AppLocalizations.of(context)!.createPlaylistMenuItem,
              style: textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.onTertiaryContainer),
            ),
          ),
        ),
      ],
      childFocusNode: _buttonFocusNode,
      builder: (_, controller, child) {
        return FloatingActionButton(
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            disabledElevation: 0,
            focusColor: colorScheme.tertiaryContainer,
            hoverColor: colorScheme.tertiaryContainer,
            foregroundColor: colorScheme.tertiaryContainer,
            backgroundColor: colorScheme.tertiaryContainer,
            focusNode: _buttonFocusNode,
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child: Icon(
              Icons.add,
              color: colorScheme.onTertiaryContainer,
            ));
      },
    );
  }
}
