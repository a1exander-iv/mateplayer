import 'package:audioplayers/audioplayers.dart'
    show AssetSource, DeviceFileSource, Source, UrlSource;

String pathFromPlayerSource({Source? source}) {
  if (source == null) {
    return "";
  }

  switch (source.runtimeType) {
    case const (DeviceFileSource):
      source = source as DeviceFileSource;
      return source.path;
    case const (AssetSource):
      source = source as AssetSource;
      return source.path;
    case const (UrlSource):
      source = source as UrlSource;
      return source.url;
    default:
      return "";
  }
}
