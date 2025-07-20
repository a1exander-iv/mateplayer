import 'package:flutter/material.dart' show Intent;

class MuteIntent extends Intent {
  const MuteIntent();
}

class PlayAndPauseButtonIntent extends Intent {
  const PlayAndPauseButtonIntent();
}

class PreviousButtonIntent extends Intent {
  const PreviousButtonIntent();
}

class NextButtonIntent extends Intent {
  const NextButtonIntent();
}

class ShuffleIntent extends Intent {
  const ShuffleIntent();
}

class RepeatIntent extends Intent {
  const RepeatIntent();
}

class FullscreenIntent extends Intent {
  const FullscreenIntent();
}
