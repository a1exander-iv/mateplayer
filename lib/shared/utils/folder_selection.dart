import 'dart:io' show Platform;

import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:file_selector/file_selector.dart' as fileSelector;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/presentation/cubits/audio_loader/audio_loader_cubit.dart';
import 'package:mate_player/presentation/cubits/settings/settings_cubit.dart';

Future<void> folderSelection(BuildContext context) async {
  SettingsCubit settingsCubit = context.read<SettingsCubit>();
  AudioLoaderCubit audioLoaderCubit = context.read<AudioLoaderCubit>();

  String? selectedDirectory;
  //AppImage works well with filePicker, this for supporting .snap and flatpak
  if (Platform.isLinux) {
    selectedDirectory = await fileSelector.getDirectoryPath();

  } else {
    selectedDirectory = await filePicker.FilePicker.platform.getDirectoryPath();
  }

  if (selectedDirectory != null) {
    settingsCubit.setDirectory(selectedDirectory);
    audioLoaderCubit.loadNewDirectory(selectedDirectory);
  }
}
