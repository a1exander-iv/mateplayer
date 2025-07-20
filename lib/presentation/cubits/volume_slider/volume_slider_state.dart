part of 'volume_slider_cubit.dart';

final class VolumeSliderState extends Equatable{
  final double sliderValue;

  const VolumeSliderState({required this.sliderValue});
  
  @override
  List<Object?> get props => [sliderValue];
}
