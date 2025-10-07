
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/settings/settings_cubit.dart';
import 'package:mate_player/presentation/enums/list_type_enum.dart';

class TrackListTypeSelection extends StatelessWidget {
  const TrackListTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsCubit settingsCubit = context.read<SettingsCubit>();
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<SettingsCubit, SettingsState>
    (builder:(context, state) {
      return MenuAnchor(
          builder: (context, controller, child) {
            return TextButton.icon(
                icon: Icon(state.listType == ListTypeEnum.gridView ? Icons.grid_view : Icons.view_list),
                onPressed: () {
                  controller.isOpen ? controller.close() : controller.open();
                },
                label: Text(state.listType == ListTypeEnum.gridView ?  appLocalizations.trackGridList : appLocalizations.trackTileList),
              );
          },
          menuChildren: [
          MenuItemButton(
            leadingIcon: Icon(Icons.grid_view),
            child: Text(appLocalizations.trackGridList),
            onPressed: () {
              settingsCubit.setListTypeValue(ListTypeEnum.gridView);
            },
          ),
          MenuItemButton(
            leadingIcon: Icon(Icons.view_list),
            child: Text(appLocalizations.trackTileList),
            onPressed: () {
              settingsCubit.setListTypeValue(ListTypeEnum.listView);
            },
          )
        ]
      );
     
    },);
  }
}