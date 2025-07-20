import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void indexPath(int index, BuildContext context) {
  switch (index) {
    case 0:
      GoRouter.of(context).go('/');
      break;
    case 1:
      GoRouter.of(context).go('/favorite');
      break;
    case 2:
      GoRouter.of(context).go('/settings');
      break;
  }
}

int calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).matchedLocation;
  if (location == '/') {
    return 0;
  }
  if (location.startsWith('/favorite')) {
    return 1;
  }
  if (location.startsWith('/settings')) {
    return 2;
  }
  return 0;
}
