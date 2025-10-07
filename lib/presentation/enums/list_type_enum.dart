enum ListTypeEnum {
  gridView,
  listView;

  String get toSharedPrefsValue {
    switch (this) {
      case ListTypeEnum.gridView:
        return "gridView";
      case ListTypeEnum.listView:
        return "listView";
    }
  }

  static ListTypeEnum fromPrefsString(String? value) {
    return switch (value) {
      "gridView" => ListTypeEnum.gridView,
      "listView" => ListTypeEnum.listView,
      _ => ListTypeEnum.gridView,
    };
  }
}
