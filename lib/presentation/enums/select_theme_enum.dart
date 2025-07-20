enum SelectThemeEnum {
  systemTheme,
  lightTheme,
  darkTheme;

  String get toSharedPrefsValue {
    switch (this) {
      case SelectThemeEnum.darkTheme:
        return "darkTheme";
      case SelectThemeEnum.lightTheme:
        return "lightTheme";
      case SelectThemeEnum.systemTheme:
        return "systemTheme";
    }
  }

  static SelectThemeEnum fromPrefsString(String value) {
    return switch (value) {
      "darkTheme" => SelectThemeEnum.darkTheme,
      "lightTheme" => SelectThemeEnum.lightTheme,
      "systemTheme" => SelectThemeEnum.systemTheme,
      _ => SelectThemeEnum.systemTheme,
    };
  }
}
