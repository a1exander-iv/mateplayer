import "package:path/path.dart" show extension;

bool checkAllowedFileExtension(String filePath) {
  switch (extension(filePath)) {
    case ".mp3" || ".m4a" || ".flac" || ".wav" || ".ogg":
      return true;
    default:
      return false;
  }
}
