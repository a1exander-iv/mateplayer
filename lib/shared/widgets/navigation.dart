
import 'package:flutter/material.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';

import 'package:mate_player/shared/utils/navigation_functions.dart';
import 'package:mate_player/shared/widgets/add_button.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(

      minWidth: 80,
      labelType: NavigationRailLabelType.selected,
      groupAlignment: -0.3,
      extended: false,
      selectedIndex: calculateSelectedIndex(context),
      onDestinationSelected: (index) {
        indexPath(index, context);
      },
      leading: const FloatingAddButton(),
      destinations: [
        NavigationRailDestination(icon: Icon(Icons.home_outlined), label: Text(AppLocalizations.of(context)!.mainScreen), selectedIcon: Icon(Icons.home)),
        NavigationRailDestination(icon: Icon(Icons.favorite_outline), label: Text(AppLocalizations.of(context)!.favoriteScreen), selectedIcon: Icon(Icons.favorite)),
        NavigationRailDestination(icon: Icon(Icons.settings_outlined), label: Text(AppLocalizations.of(context)!.settingsScreen), selectedIcon: Icon(Icons.settings)),
      ],);
  }
}

class NavigationMobile extends StatelessWidget {
  const NavigationMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: calculateSelectedIndex(context),
      onDestinationSelected: (index) {
        indexPath(index, context);
      },
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: AppLocalizations.of(context)!.mainScreen, selectedIcon: Icon(Icons.home),),
        NavigationDestination(icon: Icon(Icons.favorite_outline), label: AppLocalizations.of(context)!.favoriteScreen, selectedIcon: Icon(Icons.favorite),),
        NavigationDestination(icon: Icon(Icons.settings_outlined), label: AppLocalizations.of(context)!.settingsScreen, selectedIcon: Icon(Icons.settings),),
      ],);
  }
}