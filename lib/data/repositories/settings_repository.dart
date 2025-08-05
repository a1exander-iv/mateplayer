import 'package:flutter/material.dart';
import 'package:mate_player/data/sources/db.dart';
import 'package:mate_player/data/sources/prefs.dart';
import 'package:mate_player/presentation/enums/select_sorting_enum.dart';
import 'package:mate_player/presentation/enums/select_theme_enum.dart';

class SettingsRepository {
  SettingsRepository(this.prefs, this.appDatabase);

  final Prefs prefs;
  final AppDatabase appDatabase;

  Future<void> setLocaleLanguage(String languageCode) async {
    await prefs.setString(SharedKeys.languageCode, languageCode);
  }

  Future<void> setDirectory(String path) async {
    List<String>? directoryList = prefs.getStringList(SharedKeys.directoryList);

    directoryList ??= [path];
    if (!directoryList.contains(path)) {
      directoryList.add(path);
    }

    await prefs.setStringList(SharedKeys.directoryList, directoryList);
  }

  List<String> getDirectoryList() {
    return prefs.getStringList(SharedKeys.directoryList) ?? [];
  }

  String? getLocaleLanguageCode() {
    return prefs.getString(SharedKeys.languageCode);
  }

  Future<void> deleteDirectory(String path) async {
    List<String>? directories = getDirectoryList();
    directories.removeWhere((directoryPath) => directoryPath == path);
    await prefs.setStringList(SharedKeys.directoryList, directories);
    
  }

  Future<void> setTheme(String value) async {
    await prefs.setString(SharedKeys.theme, value);
  }

  SelectThemeEnum getTheme() {
    return SelectThemeEnum.fromPrefsString(prefs.getString(SharedKeys.theme)!);
  }

  bool getSystemColor() {
    return prefs.getBool(SharedKeys.systemColor)!;
  }

  Future<void> setSystemColor(bool value) async {
    await prefs.setBool(SharedKeys.systemColor, value);
  }

  int getColor() {
    return prefs.getInt(SharedKeys.color)!;
  }

  Future<void> setColor(Color color) async {
    await prefs.setInt(SharedKeys.color, color.toARGB32());
  }

  SelectSortingEnum getSortingValue() {
    return SelectSortingEnum.fromPrefsString(
        prefs.getString(SharedKeys.mainListSorting)!);
  }

  Future<void> setSortingValue(SelectSortingEnum value) async {
    await prefs.setString(SharedKeys.mainListSorting, value.toSharedPrefsValue);
  }

  Future<void> setTrackImagesLoading(bool value) async {
    await prefs.setBool(SharedKeys.loadTrackImages, value);
  }

  bool getTrackImagesLoadValue() {
    return prefs.getBool(SharedKeys.loadTrackImages)!;
  }
}
