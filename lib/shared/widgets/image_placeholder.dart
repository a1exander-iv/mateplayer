import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart';
import 'package:mate_player/shared/widgets/image_memory.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    super.key,
    this.imageBytes,
    required this.icon,
    this.iconSize,
    this.imageFit,
    this.cachedHeight,
    this.cachedWidth,
    this.height,
    this.width,
    this.backgroundColor,
  });

  final Uint8List? imageBytes;
  final IconData? icon;
  final double? iconSize;
  final BoxFit? imageFit;

  final int? cachedHeight;
  final int? cachedWidth;

  final double? width;
  final double? height;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: Builder(builder: (context) {
        if (imageBytes == null) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor ?? colorScheme.primaryContainer,
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: colorScheme.primary,
            ),
          );
        } else {
          final double devicePixelRatio =
              MediaQuery.of(context).devicePixelRatio;

          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child: Builder(builder: (context) {
              return ImageMemory(
                bytes: imageBytes!,
                cacheHeight: cachedHeight != null
                    ? (devicePixelRatio * cachedHeight!).round()
                    : null,
                cacheWidth: cachedWidth != null
                    ? (devicePixelRatio * cachedWidth!).round()
                    : null,
                fit: imageFit,
              );
            }),
          );
        }
      }),
    );
  }
}

class PlaylistImagePlaceholder extends StatefulWidget {
  const PlaylistImagePlaceholder(
      {super.key,
      required this.imagePath,
      required this.icon,
      this.iconSize,
      this.imageFit,
      this.cachedHeight,
      this.cachedWidth,
      this.height,
      this.width,
      this.backgroundColor});

  final String? imagePath;
  final IconData? icon;
  final double? iconSize;
  final BoxFit? imageFit;

  final int? cachedHeight;
  final int? cachedWidth;

  final double? width;
  final double? height;

  final Color? backgroundColor;

  @override
  State<PlaylistImagePlaceholder> createState() =>
      _PlaylistImagePlaceholderState();
}

class _PlaylistImagePlaceholderState extends State<PlaylistImagePlaceholder> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Builder(builder: (context) {
        if (widget.imagePath == null) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.backgroundColor ?? colorScheme.primaryContainer,
            ),
            child: Icon(
              widget.icon ?? Icons.music_note,
              size: widget.iconSize,
              color: colorScheme.primary,
            ),
          );
        } else {
          final double devicePixelRatio =
              MediaQuery.of(context).devicePixelRatio;
          return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Image.file(
                File(
                  widget.imagePath!,
                ),
                errorBuilder: (context, error, stackTrace) {
                  debugPrint("$error $stackTrace");
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.backgroundColor ??
                          colorScheme.primaryContainer,
                    ),
                    child: Icon(
                      widget.icon ?? Icons.music_note,
                      size: widget.iconSize,
                      color: colorScheme.primary,
                    ),
                  );
                },
                cacheHeight: widget.cachedHeight != null
                    ? (devicePixelRatio * widget.cachedHeight!).round()
                    : null,
                cacheWidth: widget.cachedWidth != null
                    ? (devicePixelRatio * widget.cachedWidth!).round()
                    : null,
                fit: widget.imageFit,
              ));
        }
      }),
    );
  }
}
