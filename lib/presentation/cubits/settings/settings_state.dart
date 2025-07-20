part of 'settings_cubit.dart';

final class SettingsState extends Equatable {
  final Locale? locale;
  final List<String> directoryList;
  final SelectThemeEnum theme;
  final bool isSystemColor;
  final Color color;
  final SelectSortingEnum sortValue;
  const SettingsState(
      {this.locale,
      required this.directoryList,
      required this.theme,
      required this.isSystemColor,
      required this.color,
      required this.sortValue});

  SettingsState copyWith(
      {Locale? locale,
      List<String>? directoryList,
      SelectThemeEnum? theme,
      bool? isSystemColor,
      Color? color,
      SelectSortingEnum? sortValue}) {
    return SettingsState(
        locale: locale ?? this.locale,
        directoryList: directoryList ?? this.directoryList,
        theme: theme ?? this.theme,
        isSystemColor: isSystemColor ?? this.isSystemColor,
        color: color ?? this.color,
        sortValue: sortValue ?? this.sortValue);
  }

  @override
  List<Object?> get props =>
      [locale, directoryList, theme, isSystemColor, color, sortValue];
}
