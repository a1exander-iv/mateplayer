import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mate_player/domain/models/track_model.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/picture/pictures_cubit.dart';
import 'package:mate_player/shared/modals/modal_side_sheet.dart';
import 'package:mate_player/shared/utils/bytes_to_string.dart';
import 'package:mate_player/shared/utils/parse_track_image.dart';
import 'package:mate_player/shared/utils/seconds_to_string.dart';
import 'package:mate_player/shared/widgets/image_placeholder.dart';

Future<void> showTrackInformationModalSideSheet(
    {required BuildContext context, required TrackModel track}) async {
  await showModalSideSheet(
    headerTitle: AppLocalizations.of(context)!.trackInformationSideSheetHeaderTitle,
    context: context,
    body: TrackInfoSideSheetBody(track: track),
  );
}

class TrackInfoSideSheetBody extends StatelessWidget {
  const TrackInfoSideSheetBody({
    super.key,
    required this.track,
  });

  final TrackModel track;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<PicturesCubit, PicturesState>(
              builder: (context, state) {
                if (state is PicturesLoadComplete) {
                  var picturesList =
                      parsePictureList(state.picturesDataMap, track.filePath);
                  if (picturesList.isNotEmpty) {
                    return Column(
                        children: picturesList.map((bytes) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ImagePlaceholder(
                          imageBytes: bytes,
                          icon: Icons.music_note,
                          width: 200,
                          height: 200,
                          iconSize: 64,
                        ),
                      );
                    }).toList());
                  } else {
                    return const ImagePlaceholder(
                      imageBytes: null,
                      icon: Icons.music_note,
                      width: 200,
                      height: 200,
                      iconSize: 64,
                    );
                  }
                }

                return const ImagePlaceholder(
                  imageBytes: null,
                  icon: Icons.music_note,
                  width: 200,
                  height: 200,
                  iconSize: 64,
                );
              },
            ),
            const Gap(8),
            SelectableText(
              track.trackTitle ?? appLocalizations.untitledTrack,
              style: textTheme.bodyMedium
                  ?.copyWith(fontSize: 26, color: colorScheme.onSurface),
              textAlign: TextAlign.center,
            ),
            SelectableText(
              track.trackArtist ?? appLocalizations.unknownArtist,
              style: textTheme.bodyMedium
                  ?.copyWith(fontSize: 20, color: colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            const Divider(),
            Builder(builder: (context) {
              if (track.album != null && track.album!.isNotEmpty) {
                return TrackInformationLine(
                  lineName: appLocalizations.album,
                  value: track.album!,
                );
              }
              return const SizedBox.shrink();
            }),
            Builder(builder: (context) {
              if (track.releaseYear != null && track.releaseYear!.year != 0) {
                return TrackInformationLine(
                    lineName: appLocalizations.year, value: track.releaseYear!.year.toString());
              }

              return const SizedBox.shrink();
            }),
            Builder(builder: (context) {
              if (track.genreList.isNotEmpty) {
                return TrackInformationLine(
                    lineName: appLocalizations.genre, value: track.genreList.join(", "));
              }
              return const SizedBox.shrink();
            }),
            Builder(builder: (context) {
              if (track.trackDurationInMilliseconds != null) {
                return TrackInformationLine(
                    lineName: appLocalizations.trackDuration,
                    value: secondsToString(Duration(
                            milliseconds: track.trackDurationInMilliseconds!)
                        .inSeconds));
              }
              return const SizedBox.shrink();
            }),
            Builder(builder: (context) {
              return TrackInformationLine(
                  lineName: appLocalizations.fileLocation, value: track.filePath);
            }),
            Builder(builder: (context) {
              if (track.fileSize != null) {
                final trackSize = track.fileSize!;
                return TrackInformationLine(
                    lineName: appLocalizations.fileSize,
                    value:
                        "${bytesToString(trackSize)} (${kibibytesToString(trackSize)})");
              }

              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}

class TrackInformationLine extends StatelessWidget {
  const TrackInformationLine(
      {super.key, required this.lineName, required this.value});

  final String lineName;
  final String value;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "$lineName:",
                textAlign: TextAlign.right,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                value,
                style: textTheme.bodyMedium
                    ?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
