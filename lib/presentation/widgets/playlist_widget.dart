import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mate_player/domain/models/playlist_model.dart';
import 'package:mate_player/l10n/generated/app_localizations.dart';
import 'package:mate_player/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:mate_player/shared/widgets/image_placeholder.dart'
    show PlaylistImagePlaceholder;

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key, required this.playlistCatalog});

  final List<PlaylistModel> playlistCatalog;
  @override
  Widget build(BuildContext context) {
    Map<int, PlaylistModel> catalogMap =
        playlistCatalog.reversed.toList().asMap();
    List<Widget> playlistContainerList =
        catalogMap.entries.toList().reversed.map((mapEntry) {
      return PlaylistContainer(
        playlist: mapEntry.value,
        playlistNumber: mapEntry.key + 1,
      );
    }).toList();

    return Wrap(runSpacing: 16, spacing: 16, children: playlistContainerList);
  }
}

class PlaylistContainer extends StatelessWidget {
  const PlaylistContainer(
      {super.key, required this.playlist, required this.playlistNumber});

  final PlaylistModel playlist;
  final int playlistNumber;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: 140,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorScheme.secondaryContainer,
          ),
          child: SizedBox(
              height: 40,
              child: Text(
                playlist.name == null || playlist.name!.isEmpty
                    ? "${AppLocalizations.of(context)!.playlistDefaultName} $playlistNumber"
                    : playlist.name!,
                overflow: TextOverflow.fade,
                style: TextStyle(color: colorScheme.onSecondaryContainer),
                textAlign: TextAlign.center,
              )),
        ),
        PlaylistImagePlaceholder(
          imagePath: playlist.imagePath,
          backgroundColor: colorScheme.secondary.withValues(alpha: 0.2),
          width: 140,
          height: 160,
          imageFit: BoxFit.cover,
          cachedHeight: 280,
          cachedWidth: 320,
          icon: Icons.library_music,
          iconSize: 40,
        ),
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final bool favorite = state is FavoriteInfoLoadComplete &&
                    state.playlistFavoriteMap.containsKey(playlist.id)
                ? true
                : false;
            if (favorite) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite,
                  color: colorScheme.primary,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        Material(
          color: Colors.transparent,
          child: SizedBox(
            height: 200,
            width: 140,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                GoRouter.of(context).pushNamed(
                  "playlist_screen",
                  pathParameters: {
                    "playlistId": playlist.id.toString(),
                    "playlistNumber": playlistNumber.toString()
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
