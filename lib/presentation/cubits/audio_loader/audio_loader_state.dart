part of 'audio_loader_cubit.dart';


sealed class AudioLoaderState extends Equatable {

  const AudioLoaderState();

  @override
  List<Object> get props => [];
}

final class AudioLoaderInitial extends AudioLoaderState {}

final class AudioLoadingInitial extends AudioLoaderState {

}

final class AudioLoading extends AudioLoaderState {

  final List<Directory> loadedDirectories;
  final String loadingDirectoryPath;
  final int totalDirectories;
  final int totalAudioFiles;
  final int loadedAudioFiles;
  const AudioLoading({
    required this.loadedDirectories, 
    required this.loadingDirectoryPath,
    required this.totalDirectories, 
    required this.loadedAudioFiles,
    required this.totalAudioFiles
    });

  @override
  List<Object> get props => [loadedDirectories, loadingDirectoryPath, totalDirectories, totalAudioFiles, loadedAudioFiles];


}


final class AudioLoadComplete extends AudioLoaderState {

  final List<TrackModel> audioList;
  final List<String> exceptionFilePathList;

  const AudioLoadComplete({required this.audioList, required this.exceptionFilePathList, });
  
  @override
  List<Object> get props => [audioList, exceptionFilePathList];

}

