import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key, this.actions, this.title});

  final List<Widget>? actions;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      elevation: 0,
      forceMaterialTransparency: true,
    );
  }
}
