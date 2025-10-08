import 'dart:io' show Directory;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mate_player/data/repositories/database_repository.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/audio_loader/audio_loader_cubit.dart';
import 'package:mate_player/presentation/cubits/picture/pictures_cubit.dart';
import 'package:mate_player/presentation/cubits/player/player_cubit.dart';
import 'package:mate_player/presentation/cubits/settings/settings_cubit.dart';
import 'package:mate_player/presentation/cubits/stat/stat_cubit.dart';
import 'package:mate_player/presentation/enums/select_theme_enum.dart';
import 'package:mate_player/shared/dialogs/app_info.dart';
import 'package:mate_player/shared/utils/emoji_from_language_code.dart';
import 'package:mate_player/shared/utils/folder_selection.dart';
import 'package:mate_player/shared/utils/parse_track_image.dart';
import 'package:mate_player/shared/widgets/image_placeholder.dart';
import 'package:mate_player/shared/widgets/track_list_type_selection.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Builder(builder: (context) {
      Size screenSize = MediaQuery.of(context).size;
      double leftContentPadding = 0;
      double rightContentPadding = 0;
      if (screenSize.width >= 1200) {
        leftContentPadding = screenSize.width * 0.1;
        rightContentPadding = screenSize.width * 0.1;
      }

      return Scaffold(
        appBar: AppBar(
          actionsPadding: EdgeInsets.zero,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(
                left: leftContentPadding, right: rightContentPadding),
            child: Text(
              appLocalizations.settingsScreen,
              style: textTheme.headlineMedium,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: leftContentPadding, right: rightContentPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(8),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SectionName(name: appLocalizations.languageSection),
                ),
                const LanguageSelectionSettingsWidget(),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SectionName(name: appLocalizations.fileSection),
                      TextButton.icon(
                        onPressed: () {
                          List<Directory> directoryList =
                              context.read<SettingsCubit>().getDirectoryList();
                          context
                              .read<AudioLoaderCubit>()
                              .update(directoryList);
                        },
                        icon: const Icon(Icons.refresh),
                        label: Text(appLocalizations.refreshButton),
                      )
                    ],
                  ),
                ),
                const FolderSelectionWidget(),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                const Gap(16),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SectionName(name: appLocalizations.themeSection),
                ),
                const ThemeSelectionWidget(),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                const Gap(16),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SectionName(name: appLocalizations.colorSection),
                ),
                const AppColorSelectionWidget(),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                const Gap(16),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SectionName(name: appLocalizations.statSection),
                ),
                BlocProvider(
                  lazy: false,
                  create: (context) =>
                      StatCubit(context.read<DatabaseRepository>()),
                  child: const StatTile(),
                ),
                 const Divider(
                  thickness: 1,
                  height: 1,
                ),
                const Gap(16),
                Padding(
                  padding: EdgeInsets.only(left: 16), 
                  child: SectionName(name: appLocalizations.additionalSectionSettingsScreen),
                ),
                const TrackImageCheckboxTile(),
                ListTile(
                  title: Text(appLocalizations.trackDisplayOption),
                  trailing: TrackListTypeSelection(),
                ),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                const Gap(16),
                Padding(
                  padding: EdgeInsets.only(left: 16), 
                  child: SectionName(name: appLocalizations.informationSectionSettingsScreen ),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.appInformation),
                  leading: const Icon(Icons.info),
                  onTap: () async {
                    showAppInfoDialog(context: context);
                  },
                ),          
              ],
            ),
          ),
        ),
      );
    });
  }
}

class LanguageSelectionSettingsWidget extends StatefulWidget {
  const LanguageSelectionSettingsWidget({super.key});

  @override
  State<LanguageSelectionSettingsWidget> createState() =>
      _LanguageSelectionSettingsWidgetState();
}

class _LanguageSelectionSettingsWidgetState
    extends State<LanguageSelectionSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const LanguageSelectionDialog();
            });
      },
      leading: const Icon(Icons.language),
      title: Row(
        children: [
          Text(
            AppLocalizations.of(context)!.languageName,
            style: const TextStyle(),
                      
          ),
          const Gap(8),
          emojiWidgetFromLanguageCode(Localizations.localeOf(context).languageCode),
        ],
      ),
    );
  }
}

class LanguageSelectionDialog extends StatefulWidget {
  const LanguageSelectionDialog({super.key});

  @override
  State<LanguageSelectionDialog> createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  Locale _locale = const Locale('en');

  final Map<String, Locale> _localesMap = {
    "Русский": const Locale("ru"),
    "English": const Locale("en"),
  };

  @override
  void didChangeDependencies() {
    _locale = Localizations.localeOf(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(AppLocalizations.of(context)!.languageSelectionDialog),
      children: _localesMap.entries.map((entry) {
        return RadioListTile<Locale>(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                      entry.key,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const Gap(8),
                  emojiWidgetFromLanguageCode(entry.value.languageCode),


              ],
            ),
            value: entry.value,
            groupValue: _locale,
            onChanged: (Locale? value) {
              setState(() {
                _locale = value!;
                context.read<SettingsCubit>().setLocale(_locale);
              });
            });
      }).toList(),
    );
  }
}

class FolderSelectionWidget extends StatelessWidget {
  const FolderSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SettingsCubit settingsCubit = context.read<SettingsCubit>();
    AudioLoaderCubit audioLoaderCubit = context.read<AudioLoaderCubit>();
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          onTap: () async {
            await folderSelection(context);
          },
          leading: const Icon(Icons.folder),
          title: Text(appLocalizations.foldersTitle),
          subtitle:  Text(appLocalizations.foldersSubtitle),
          trailing: const Icon(Icons.arrow_right),
        ),
        BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                if (state.directoryList.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(appLocalizations.usedFolders),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: state.directoryList.map((directoryPath) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                style: textTheme.bodySmall,
                                controller: TextEditingController.fromValue(
                                    TextEditingValue(text: directoryPath)))),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      contentPadding: const EdgeInsets.all(16),
                                      actionsPadding: const EdgeInsets.all(16),
                                      actionsOverflowButtonSpacing: 8,
                                      alignment: Alignment.center,
                                      title: Center(child: Text(AppLocalizations.of(context)!.deleteFolderDialogTitle)),
                                      content: Text(
                                          AppLocalizations.of(context)!.deleteFolderDialogContent),
                                      actions: [
                                        OutlinedButton(
                                            onPressed: () {
                                              GoRouter.of(context).pop();
                                            },
                                            child: Text(AppLocalizations.of(context)!.deleteFolderCancel)),
                                        FilledButton(
                                            onPressed: () {
                                              settingsCubit.deleteDirectory(
                                                  directoryPath);
                                                                                           
                                              context
                                                  .read<PlayerCubit>()
                                                  .stop();
                                              audioLoaderCubit.init();
                                              GoRouter.of(context).pop();
                                            },
                                            child: Text(AppLocalizations.of(context)!.deleteFolderConfirm)),
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class SectionName extends StatelessWidget {
  const SectionName({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          name,
          style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )
      ],
    );
  }
}

class ThemeSelectionWidget extends StatefulWidget {
  const ThemeSelectionWidget({super.key});

  @override
  State<ThemeSelectionWidget> createState() => _ThemeSelectionWidgetState();
}

class _ThemeSelectionWidgetState extends State<ThemeSelectionWidget> {
  SelectThemeEnum themeSelection = SelectThemeEnum.systemTheme;

  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = context.read<SettingsCubit>();

    return BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
      themeSelection = state.theme;
      return Column(
          children: SelectThemeEnum.values.map((element) {
        String theme = "";
        switch (element) {
          case SelectThemeEnum.darkTheme:
            theme = AppLocalizations.of(context)!.darkTheme;
          case SelectThemeEnum.lightTheme:
            theme = AppLocalizations.of(context)!.lightTheme;
          case SelectThemeEnum.systemTheme:
            theme = AppLocalizations.of(context)!.systemTheme;
        }

        return RadioListTile(
            title: Text(theme),
            value: element,
            groupValue: themeSelection,
            onChanged: (value) {
              setState(() {
                themeSelection = value!;
                settingsCubit.setTheme(value);
              });
            });
      }).toList());
    });
  }
}

class AppColorSelectionWidget extends StatefulWidget {
  const AppColorSelectionWidget({super.key});

  @override
  State<AppColorSelectionWidget> createState() =>
      _AppColorSelectionWidgetState();
}

class _AppColorSelectionWidgetState extends State<AppColorSelectionWidget> {
  List<Color> colorList = [
    Colors.indigo,
    Colors.blueAccent,
    Colors.blue,
    Colors.cyan,
    Colors.lightBlueAccent,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.grey,
    Colors.blueGrey,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    SettingsCubit settingsCubit = context.read<SettingsCubit>();
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) {
        return previous.isSystemColor != current.isSystemColor ||
            previous.color.hashCode != current.color.hashCode;
      },
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              title: Text(appLocalizations.useSystemColor),
              trailing: Checkbox(
                  value: state.isSystemColor,
                  onChanged: (value) {
                    settingsCubit.setSystemColor(value!);
                  }),
              onTap: () {
                settingsCubit.setSystemColor(!state.isSystemColor);
              },
            ),
            ListTile(
              enabled: state.isSystemColor ? false : true,
              title: Text(appLocalizations.colorTileTitle),
              subtitle: Text(appLocalizations.colorTileSubtitle),
              leading: const Icon(Icons.format_paint),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return BlocBuilder<SettingsCubit, SettingsState>(
                        builder: (context, state) {
                          return SimpleDialog(
                            contentPadding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16, top: 8),
                            title: Text(appLocalizations.colorDialogTitle),
                            children: [
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: colorList.map((color) {
                                  return IconButton(
                                    onPressed: () {
                                      settingsCubit.setColor(color);
                                    },
                                    icon: color.toARGB32() ==
                                            state.color.toARGB32()
                                        ? const Icon(Icons.circle)
                                        : const Icon(Icons.circle_outlined),
                                    color: color,
                                  );
                                }).toList(),
                              )
                            ],
                          );
                        },
                      );
                    });
              },
            )
          ],
        );
      },
    );
  }
}

class StatTile extends StatelessWidget {
  const StatTile({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        ListTile(
          title: Text(appLocalizations.statTileTitle),
          leading: const Icon(Icons.insert_chart),
          onTap: () {
            showDialog(
                context: context,
                builder: (dialogContext) {
                  return BlocProvider.value(
                    value: BlocProvider.of<StatCubit>(context),
                    child: Dialog.fullscreen(
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            title: Text(appLocalizations.statDialogTitle),
                          ),
                          SliverToBoxAdapter(child: StatInfo()),
                          SliverGap(16),
                          SliverMainAxisGroup(
                              slivers: [TotalListenedTimeByTracksStatWidget()])
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        ListTile(
          title: Text(appLocalizations.statTileListeningHistoryClear),
          onTap: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: Text(
                    appLocalizations.statTileListeningHistoryClearDialogTitle,
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    OutlinedButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child: Text(appLocalizations.statTileListeningHistoryClearCancel)),
                    FilledButton(
                        onPressed: () {
                          context.read<StatCubit>().clearListeningHistory();
                          GoRouter.of(context).pop();
                        },
                        child: Text(appLocalizations.statTileListeningHistoryClearConfirm)),
                  ],
                );
              },
            );
          },
        )
      ],
    );
  }
}

class StatInfo extends StatefulWidget {
  const StatInfo({super.key});

  @override
  State<StatInfo> createState() => _StatInfoState();
}

class _StatInfoState extends State<StatInfo> {
  @override
  void initState() {
    super.initState();
    context.read<StatCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatCubit, StatState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            children: [
              Builder(builder: (context) {
                final screenSize = MediaQuery.of(context).size;
                if (screenSize.width > 600) {
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TotalTracksStatWidget(),
                      ),
                      Expanded(
                        child: TotalListenedTimeStatWidget(),
                      ),
                    ],
                  );
                } else {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TotalTracksStatWidget(),
                      Gap(32),
                      TotalListenedTimeStatWidget(),
                    ],
                  );
                }
              }),
            ],
          ),
        );
      },
    );
  }
}

class TotalTracksStatWidget extends StatelessWidget {
  const TotalTracksStatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<StatCubit, StatState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.statTotalTracks,
              style: textTheme.titleLarge,
            ),
            Builder(builder: (context) {
              if (state is StatLoadComplete) {
                return TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween(begin: 0.0, end: state.totalTracks),
                    builder: (context, value, child) {
                      return Text(value.toInt().toString(),
                          style: textTheme.headlineMedium
                              ?.copyWith(color: colorScheme.primary));
                    });
              } else {
                return Skeletonizer(
                    child: Text("000", style: textTheme.headlineMedium));
              }
            }),
          ],
        );
      },
    );
  }
}

class TotalListenedTimeStatWidget extends StatelessWidget {
  const TotalListenedTimeStatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<StatCubit, StatState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.statTotalListened, style: textTheme.titleLarge),
            Builder(builder: (context) {
              if (state is StatLoadComplete) {
                int totalMinutes = state.totalListenedTimeInSeconds ~/ 60;
                return TweenAnimationBuilder(
                  tween:
                      Tween<double>(begin: 0.0, end: totalMinutes.toDouble()),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    return Text(value.toInt().toString(),
                        style: textTheme.headlineMedium
                            ?.copyWith(color: colorScheme.primary));
                  },
                );
              } else {
                return const Skeletonizer(child: Text("0000"));
              }
            }),
            Builder(builder: (context) {
              if (state is StatLoadComplete) {
                
                return Text(
                  AppLocalizations.of(context)
                          ?.nMinutes(state.totalListenedTimeInSeconds ~/ 60) ??
                      "",
                  style: textTheme.titleLarge,
                );
              } else {
                return Text(
                  AppLocalizations.of(context)?.nMinutes(0) ?? "",
                  style: textTheme.titleLarge,
                );
              }
            }),
          ],
        );
      },
    );
  }
}

class TotalListenedTimeByTracksStatWidget extends StatelessWidget {
  const TotalListenedTimeByTracksStatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatCubit, StatState>(
      builder: (context, state) {
        if (state is StatLoadComplete) {
          final entriesList =
              state.listenedTimeInSecondsByTracksMap.entries.toList();
          return SliverMainAxisGroup(slivers: [
            state.listenedTimeInSecondsByTracksMap.entries.isNotEmpty
                ? SliverToBoxAdapter(
                    child: Center(
                        child: Text(
                      AppLocalizations.of(context)!.statListeningTimeByTracks,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    )),
                  )
                : const SliverToBoxAdapter(
                    child: SizedBox.shrink(),
                  ),
            SliverList.builder(
              itemCount: entriesList.length,
              itemBuilder: (context, index) {
                final entry = entriesList[index];

                return ListTile(
                  leading: BlocBuilder<PicturesCubit, PicturesState>(
                    builder: (context, state) {
                      String? imagePath = state is PicturesLoadComplete
                            ? parseTrackImagePath(
                                state.picturesDataMap,
                                entry.key.filePath
                              )
                            : null;
                      return ImagePlaceholder(
                        icon: Icons.music_note,
                        width: 48,
                        height: 48,
                        cachedHeight: 48,
                        cachedWidth: 48,
                        imagePath: imagePath,
                      );
                    },
                  ),
                  title: Text(entry.key.trackTitle ?? entry.key.fileBaseName),
                  subtitle: Text(entriesList[index].key.trackArtist ??
                      "${AppLocalizations.of(context)?.unknownArtist}"),
                  trailing: Text(
                    "${(entry.value ~/ 60).toString()} ${AppLocalizations.of(context)?.shortMinute} ${entry.value % 60} ${AppLocalizations.of(context)?.shortSecond}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              },
            ),
          ]);
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox(),
          );
        }
      },
    );
  }
}


class TrackImageCheckboxTile extends StatelessWidget {
  const TrackImageCheckboxTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>
    (builder:(context, state) {
      return CheckboxListTile(
        title: Text(AppLocalizations.of(context)!.trackImageCheckboxTileTitle),
        value: state.loadTrackImages, onChanged: (value) {
          context.read<SettingsCubit>().setTrackImagesLoading(!state.loadTrackImages);
        });
    },);
  }
}
