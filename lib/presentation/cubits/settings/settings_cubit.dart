import 'dart:io' show Directory;
import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:mate_player/data/repositories/settings_repository.dart';
import 'package:mate_player/presentation/enums/select_sorting_enum.dart';
import 'package:mate_player/presentation/enums/select_theme_enum.dart';
import 'package:window_manager/window_manager.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required this.settingsRepository,
    required List<String> directoryList,
    required SelectThemeEnum theme,
    required bool isSystemColor,
    required Color color,
    required SelectSortingEnum sortValue,
    required bool loadTrackImages
  }) : super(
         SettingsState(
           directoryList: directoryList,
           theme: theme,
           isSystemColor: isSystemColor,
           color: color,
           sortValue: sortValue,
           loadTrackImages: loadTrackImages
         ),
       );

  final SettingsRepository settingsRepository;

  bool fullscreen = false;

  void setLocale(Locale locale) async {
    await settingsRepository.setLocaleLanguage(locale.languageCode);
    emit(state.copyWith(locale: locale));
  }

  void setDirectory(String path) async {
    await settingsRepository.setDirectory(path);
    List<String> directoryList = settingsRepository.getDirectoryList();
    emit(state.copyWith(directoryList: directoryList));
  }

  Future<void> deleteDirectory(String path) async {
    await settingsRepository.deleteDirectory(path);
    List<String>? directoryList = settingsRepository.getDirectoryList();
    emit(state.copyWith(directoryList: directoryList));
  }

  Future<void> setTheme(SelectThemeEnum theme) async {
    await settingsRepository.setTheme(theme.toSharedPrefsValue);
    emit(state.copyWith(theme: theme));
  }

  Future<void> setSystemColor(bool value) async {
    await settingsRepository.setSystemColor(value);
    emit(state.copyWith(isSystemColor: value));
  }

  Future<void> setColor(Color color) async {
    await settingsRepository.setColor(color);
    emit(state.copyWith(color: color));
  }

  Future<void> setSortValue(SelectSortingEnum value) async {
    await settingsRepository.setSortingValue(value);
    emit(state.copyWith(sortValue: value));
  }

  List<Directory> getDirectoryList() {
    List<Directory> directoryList = settingsRepository
        .getDirectoryList()
        .map((directoryPath) => Directory(directoryPath))
        .toList();
    return directoryList;
  }

  void setFullscreen() async {
    fullscreen = !fullscreen;
    await WindowManager.instance.setFullScreen(fullscreen);
  }

  void setTrackImagesLoading(bool value) async {
  await settingsRepository.setTrackImagesLoading(value);
  emit(state.copyWith(loadTrackImages: value));
  }
}
