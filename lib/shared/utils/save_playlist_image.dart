import 'dart:io' show Directory, File;
import 'dart:typed_data' show Uint8List;

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart'
    show getApplicationSupportDirectory;

Future<String> savePlaylistImage(Uint8List imageBytes, String imageFilePath) async {
  final appDir = await getApplicationSupportDirectory();
  final playlistImagesDir = Directory('${appDir.path}/playlist_images');

  if (!playlistImagesDir.existsSync()) {
    playlistImagesDir.createSync(recursive: true);
  }

  final fileName =
      "${DateTime.now().millisecondsSinceEpoch}${p.extension(imageFilePath)}";
  final savedImagePath = '${playlistImagesDir.path}/$fileName';

  await File(savedImagePath).writeAsBytes(imageBytes);

  return savedImagePath;
}
