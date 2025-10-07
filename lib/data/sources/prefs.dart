import 'package:flutter/material.dart' show Colors;
import 'package:mate_player/presentation/enums/list_type_enum.dart';
import 'package:mate_player/presentation/enums/select_sorting_enum.dart';
import 'package:mate_player/presentation/enums/select_theme_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedKeys {
  static const String languageCode = "languageCode";
  static const String directoryList = "directoryList";
  static const String theme = "theme";
  static const String systemColor = "systemColor";
  static const String color = "color";
  static const String mainListSorting = "mainListSorting";
  static const String loadTrackImages = "loadTrackImages";
  static const String listType = "listType";
}

class Prefs {
  final SharedPreferences sharedPreferences;

  Prefs({required this.sharedPreferences});

  void initValues() async {
    // String? languageCode = sharedPreferences.getString(SharedKeys.languageCode);
    // languageCode ?? sharedPreferences.setString(SharedKeys.languageCode, "en");

    List<String>? directoryList =
        sharedPreferences.getStringList(SharedKeys.directoryList);
    directoryList ??
        sharedPreferences.setStringList(SharedKeys.directoryList, []);

    String? theme = sharedPreferences.getString(SharedKeys.theme);
    theme ??
        sharedPreferences.setString(
            SharedKeys.theme, SelectThemeEnum.systemTheme.toSharedPrefsValue);

    bool? isSystemColor = sharedPreferences.getBool(SharedKeys.systemColor);
    isSystemColor ?? sharedPreferences.setBool(SharedKeys.systemColor, true);

    int? color = sharedPreferences.getInt(SharedKeys.color);
    color ??
        sharedPreferences.setInt(SharedKeys.color, Colors.indigo.toARGB32());

    String? mainListSorting =
        sharedPreferences.getString(SharedKeys.mainListSorting);
    mainListSorting ??
        sharedPreferences.setString(SharedKeys.mainListSorting,
            SelectSortingEnum.withoutSorting.toSharedPrefsValue);

    bool? loadTrackImages = sharedPreferences.getBool(SharedKeys.loadTrackImages);
    loadTrackImages ?? sharedPreferences.setBool(SharedKeys.loadTrackImages, true);

    String? listType = sharedPreferences.getString(SharedKeys.listType);
    listType ?? sharedPreferences.setString(SharedKeys.listType, ListTypeEnum.gridView.toSharedPrefsValue);
  }

  Future<bool> setInt(String key, int value) {
    return sharedPreferences.setInt(key, value);
  }

  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  Future<bool> setString(String key, String value) {
    return sharedPreferences.setString(key, value);
  }

  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  Future<bool> setBool(String key, bool value) {
    return sharedPreferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  Future<bool> setDouble(String key, double value) {
    return sharedPreferences.setDouble(key, value);
  }

  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  Future<bool> setStringList(String key, List<String> value) {
    return sharedPreferences.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return sharedPreferences.getStringList(key);
  }

  Object? setObject(String key) {
    return sharedPreferences.get(key);
  }

  Set<String> getKeys(String key) {
    return sharedPreferences.getKeys();
  }
}
