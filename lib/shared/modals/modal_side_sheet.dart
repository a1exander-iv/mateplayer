import 'package:flutter/material.dart'
    show Widget, Material, Icons, Theme, MaterialLocalizations, IconButton;
import 'package:flutter/widgets.dart';

Future<void> showModalSideSheet(
    {required BuildContext context,
    required Widget body,
    String? headerTitle,
    Duration? dialogTransitionDuration}) async {
  await showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Modal Side Sheet",
      context: context,
      transitionDuration:
          dialogTransitionDuration ?? const Duration(milliseconds: 250),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(1, 0), end: const Offset(0, 0))
              .animate(animation),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return ModalSideSheet(
            addBackIconButton: true,
            addCloseIconButton: false,
            headerTitle: headerTitle ?? "",
            body: body);
      });
}

class ModalSideSheetHeader extends StatelessWidget {
  const ModalSideSheetHeader(
      {super.key,
      required this.addBackIconButton,
      required this.headerTitle,
      this.headerTitleTextStyle,
      this.backButtonTooltip,
      this.closeButtonTooltip,
      required this.addCloseIconButton});

  final bool addBackIconButton;
  final String? backButtonTooltip;
  final bool addCloseIconButton;
  final String? closeButtonTooltip;
  final String headerTitle;
  final TextStyle? headerTitleTextStyle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 24),
        child: Row(
          children: [
            addBackIconButton
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Theme.of(context).colorScheme.outline,
                    tooltip: backButtonTooltip ??
                        MaterialLocalizations.of(context).backButtonTooltip,
                  )
                : const SizedBox.shrink(),
            addBackIconButton
                ? const SizedBox(
                    width: 12,
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    headerTitle,
                    style: headerTitleTextStyle ??
                        TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 20),
                  )),
                  addCloseIconButton
                      ? Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                            tooltip: closeButtonTooltip ??
                                MaterialLocalizations.of(context)
                                    .closeButtonTooltip,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModalSideSheet extends StatelessWidget {
  const ModalSideSheet(
      {super.key,
      required this.body,
      required this.addBackIconButton,
      required this.headerTitle,
      this.headerTitleTextStyle,
      this.backButtonTooltip,
      this.closeButtonTooltip,
      required this.addCloseIconButton});

  final Widget body;
  final bool addBackIconButton;
  final String? backButtonTooltip;
  final bool addCloseIconButton;
  final String? closeButtonTooltip;
  final String headerTitle;
  final TextStyle? headerTitleTextStyle;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        borderRadius: screenWidth > 600
            ? const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))
            : null,
        clipBehavior: screenWidth > 600 ? Clip.hardEdge : Clip.none,
        elevation: 1,
        child: Container(
          constraints:
              BoxConstraints(maxWidth: screenWidth > 600 ? 400 : screenWidth),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    ModalSideSheetHeader(
                      addBackIconButton: true,
                      headerTitle: headerTitle,
                      addCloseIconButton: false,
                    ),
                    Flexible(child: body),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
