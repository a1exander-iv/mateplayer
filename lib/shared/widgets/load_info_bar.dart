import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/audio_loader/audio_loader_cubit.dart';

class LoadInfoBarContent extends StatelessWidget {
  const LoadInfoBarContent({super.key, required this.bottomPadding});
  final double bottomPadding;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioLoaderCubit, AudioLoaderState>(
      builder: (context, state) {
        if (state is AudioLoadingInitial || state is AudioLoading) {
          return Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 200,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface),
                    child: Builder(builder: (context) {
                      if (state is AudioLoadingInitial) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.loading,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onInverseSurface),
                                ),
                              ],
                            ),
                            const LinearProgressIndicator(),
                          ],
                        );
                      } else if (state is AudioLoading) {
                        final directoryPath = state.loadingDirectoryPath;
                        final totalAudioFiles = state.totalAudioFiles;
                        final loadedFiles = state.loadedAudioFiles;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Builder(builder: (context) {
                                    if (directoryPath.length > 30) {
                                      return Text(
                                        "...${directoryPath.substring(15)}",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onInverseSurface,
                                            overflow: TextOverflow.fade),
                                      );
                                    }
                                    return Text(
                                      directoryPath,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onInverseSurface,
                                          overflow: TextOverflow.fade),
                                    );
                                  }),
                                ),
                                const Gap(8),
                                Flexible(
                                    child: Text(
                                  "$loadedFiles / $totalAudioFiles",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onInverseSurface,
                                      overflow: TextOverflow.fade),
                                )),
                              ],
                            ),
                            LinearProgressIndicator(
                              value: loadedFiles / totalAudioFiles,
                            )
                          ],
                        );
                      }

                      return const SizedBox();
                    }),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}