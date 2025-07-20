part of 'pictures_cubit.dart';

sealed class PicturesState extends Equatable {
  const PicturesState();

  @override
  List<Object> get props => [];
}

final class PicturesInitial extends PicturesState {}

final class PicturesLoadComplete extends PicturesState {
  final Map<String, List<PictureModel>> picturesDataMap;

  const PicturesLoadComplete({required this.picturesDataMap});

  @override
  List<Object> get props => [picturesDataMap];
}
