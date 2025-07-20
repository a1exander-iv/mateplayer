import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/domain/models/picture_model.dart';
import 'package:mate_player/domain/models/track_model.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/playlist/playlist_cubit.dart';
import 'package:mate_player/presentation/enums/playlist_dialog_type_enum.dart';
import 'package:mate_player/presentation/widgets/track_tile.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class PlaylistCommonDialogBody extends StatefulWidget {
  const PlaylistCommonDialogBody(
      {super.key,
      required this.playlistDialogType,
      required this.playlistNameController,
      required this.nameGlobalKey});

  final PlaylistDialogType playlistDialogType;
  final TextEditingController playlistNameController;
  final GlobalKey nameGlobalKey;

  @override
  State<PlaylistCommonDialogBody> createState() =>
      _PlaylistCommonDialogBodyState();
}

class _PlaylistCommonDialogBodyState extends State<PlaylistCommonDialogBody> {
  late final PlaylistCubit playlistCubit;

  @override
  void initState() {
    playlistCubit = context.read<PlaylistCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Column(
          children: [
            Form(
              key: widget.nameGlobalKey,
              child: TextFormField(
                maxLength: 70,
                controller: widget.playlistNameController,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.playlistCommonDialogInputLabelText,
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.playlistCommonDialogInputValidatorText;
                  }
                  return null;
                },
              ),
            ),
            Row(
              children: [
                Flexible(
                    child: Text(AppLocalizations.of(context)!.playlistCommonDialogImageLabelText,
                        style:
                            textTheme.headlineMedium?.copyWith(fontSize: 20))),
                IconButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image, allowedExtensions: [
                        "jpg",
                        "png",
                        "bmp",
                        "tiff",
                        "ico"
                      ]);

                      if (result != null) {
                        File imageFile = File(result.files.single.path!);

                        Uint8List imageBytes = imageFile.readAsBytesSync();

                        final appDir = await getApplicationSupportDirectory();
                        final playlistImagesDir =
                            Directory('${appDir.path}/playlist_images');

                        if (!playlistImagesDir.existsSync()) {
                          playlistImagesDir.createSync(recursive: true);
                        }

                        final fileName =
                            "${DateTime.now().millisecondsSinceEpoch}${p.extension(imageFile.path)}";
                        final savedImagePath =
                            '${playlistImagesDir.path}/$fileName';

                        await File(savedImagePath).writeAsBytes(imageBytes);

                        playlistCubit.playlistImagePath = savedImagePath;
                      }
                    },
                    icon: Icon(
                      Icons.add_photo_alternate,
                      color: colorScheme.primary,
                    ))
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Text(AppLocalizations.of(context)!.playlistCommonDialogTracks,
                        style:
                            textTheme.headlineMedium?.copyWith(fontSize: 20))),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return BlocProvider.value(
                              value: context.watch<PlaylistCubit>(),
                              child: Dialog.fullscreen(
                                backgroundColor: colorScheme.surface,
                                child: Column(
                                  children: [
                                    AppBar(
                                      title: Text(AppLocalizations.of(context)!.playlistCommonDialogSelectTracksDialogTitle),
                                    ),
                                    Flexible(
                                        child: CustomScrollView(slivers: [
                                      CheckBoxSelectTrackList(
                                        playlistDialogType:
                                            widget.playlistDialogType,
                                      )
                                    ]))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.music_note),
                        Text(
                          AppLocalizations.of(context)!.playlstCommonDialogSelectTracksButton,
                          style: textTheme.titleSmall
                              ?.copyWith(color: colorScheme.primary),
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxSelectTrackList extends StatefulWidget {
  const CheckBoxSelectTrackList({super.key, required this.playlistDialogType});

  final PlaylistDialogType playlistDialogType;
  @override
  State<CheckBoxSelectTrackList> createState() =>
      _CheckBoxSelectTrackListState();
}

class _CheckBoxSelectTrackListState extends State<CheckBoxSelectTrackList> {
  List<int> selectedIdList = [];
  List<TrackModel> trackList = [];
  late final Map<String, List<PictureModel>> pictureMap;
  late final PlaylistCubit playlistCubit;
  @override
  void initState() {
    playlistCubit = context.read<PlaylistCubit>();
    trackList = playlistCubit.getTrackList();
    pictureMap = playlistCubit.getPictureMap();
    selectedIdList = List<int>.from(playlistCubit.playlistTrackIdList ?? []);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: trackList.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIdList.contains(trackList[index].id);
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
              right: 8,
              left: 8,
            ),
            child: CheckboxTrackTile(
              track: trackList[index],
              value: isSelected,
              onChanged: (value) {
                if (value!) {
                  setState(() {
                    selectedIdList.add(trackList[index].id);
                  });
                } else {
                  setState(() {
                    selectedIdList
                        .removeWhere((item) => item == trackList[index].id);
                  });
                }
                playlistCubit.playlistTrackIdList = selectedIdList;
              },
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
