enum SelectSortingEnum {
  byDurationAscending,
  byDurationDescending,
  byDateAddedAscending,
  byDateAddedDescending,
  byTitleAscending,
  byTitleDescending,
  byYearAscending,
  byYearDescending,
  byFileNameAscending,
  byFileNameDescending,
  withoutSorting;

  String get toSharedPrefsValue {
    switch (this) {
      case SelectSortingEnum.byDurationAscending:
        return "byDurationAscending";
      case SelectSortingEnum.byDurationDescending:
        return "byDurationDescending";

      case SelectSortingEnum.byDateAddedAscending:
        return "byDateAddedAscending";
      case SelectSortingEnum.byDateAddedDescending:
        return "byDateAddedDescending";

      case SelectSortingEnum.byTitleAscending:
        return "byTitleAscending";
      case SelectSortingEnum.byTitleDescending:
        return "byTitleDescending";

      case SelectSortingEnum.byYearAscending:
        return "byYearAscending";
      case SelectSortingEnum.byYearDescending:
        return "byYearDescending";
      case SelectSortingEnum.byFileNameAscending:
        return "byFileNameAscending";

      case SelectSortingEnum.byFileNameDescending:
        return "byFileNameDescending";
      case SelectSortingEnum.withoutSorting:
        return "withoutSorting";
    }
  }

  static SelectSortingEnum fromPrefsString(String? value) {
    return switch (value) {
      "byDurationAscending" => SelectSortingEnum.byDurationAscending,
      "byDurationDescending" => SelectSortingEnum.byDurationDescending,
      "byDateAddedAscending" => SelectSortingEnum.byDateAddedAscending,
      "byDateAddedDescending" => SelectSortingEnum.byDateAddedDescending,
      "byTitleAscending" => SelectSortingEnum.byTitleAscending,
      "byTitleDescending" => SelectSortingEnum.byTitleDescending,
      "byYearAscending" => SelectSortingEnum.byYearAscending,
      "byYearDescending" => SelectSortingEnum.byYearDescending,
      "byFileNameAscending" => SelectSortingEnum.byFileNameAscending,
      "byFileNameDescending" => SelectSortingEnum.byFileNameDescending,
      "withoutSorting" => SelectSortingEnum.withoutSorting,
      _ => SelectSortingEnum.withoutSorting,
    };
  }
}
