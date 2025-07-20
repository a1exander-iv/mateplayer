
import 'package:flutter/material.dart' show BorderRadius, Widget, SizedBox, ClipRRect;
import 'package:flutter_svg/svg.dart';
import 'package:mate_player/shared/resources/asset_path.dart';


Map<String, String> _emojiLanguageCodePathMap = {
  "ru": AssetPath.rusFlag,
  "en": AssetPath.usaFlag,
};

Widget emojiWidgetFromLanguageCode(String languageCode) {

  if (_emojiLanguageCodePathMap.containsKey(languageCode)) {
    
    final icon = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SvgPicture.asset(
        height: 15,
        width: 15,
        _emojiLanguageCodePathMap[languageCode]!, semanticsLabel: languageCode,),
    );

    return icon;
  }

  return const SizedBox.shrink();


}