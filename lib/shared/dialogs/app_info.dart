import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/shared/resources/asset_path.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

void showAppInfoDialog({required BuildContext context}) {
  Uri appUrl = Uri.parse("https://github.com/a1exander-iv/mate_player");
  Uri freepikUrl = Uri.parse("https://freepik.com/");
  Uri svgrepoUrl = Uri.parse("https://www.svgrepo.com/");
  ColorScheme colorScheme = Theme.of(context).colorScheme;

  Future<PackageInfo> infoFuture = PackageInfo.fromPlatform();

  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        contentPadding: EdgeInsetsGeometry.only(left: 8, right: 8, top: 16, bottom: 16),
        
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AssetPath.logo256), fit: BoxFit.cover),
                   ),
              ),
              Text(
                "Mate Player",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              FutureBuilder<PackageInfo>(
                future: infoFuture,
                builder: (context, snapshot) {
                  
                  if (snapshot.hasData) {
                    PackageInfo? packageInfo = snapshot.data;
                    return SelectableText(
                    packageInfo != null ? "${packageInfo.version} (${packageInfo.buildNumber}) ${Platform.operatingSystem}" : "",
                  style: TextStyle(fontSize: 16),
                );
                  } 

                  return Skeletonizer(child: Text("___________"));
                },
              
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SelectableText.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: "",
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: appUrl.toString(),
                        
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: colorScheme.onSurfaceVariant,
                          
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrl(appUrl);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SelectableText.rich(

                  TextSpan(
                    text: "${AppLocalizations.of(context)!.imagesProvided}: ",
                    
                    children: [
                      TextSpan(
                        text: freepikUrl.toString(),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrl(freepikUrl);
                          },
                      ),
                    ],
                  ),
                ),
                SelectableText.rich(

                  TextSpan(
                    text: "${AppLocalizations.of(context)!.thirdPartyIcons}: ",
                    
                    children: [
                      TextSpan(
                        text: svgrepoUrl.toString(),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrl(svgrepoUrl);
                          },
                      ),
                    ],
                  ),
                ),
        
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      child: Text(
                        MaterialLocalizations.of(context).backButtonTooltip,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                        GoRouter.of(context).pushNamed("license");
                      },
                      child: Text(
                        MaterialLocalizations.of(
                          context,
                        ).viewLicensesButtonLabel,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
