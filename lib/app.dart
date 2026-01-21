import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/router/app_router.dart';
import 'theme/app_theme.dart';
import 'package:one_piece_companion/core/theme/app_theme.dart';

class OnePieceApp extends StatelessWidget {
  const OnePieceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'One Piece Companion',
      debugShowCheckedModeBanner: false,
      theme: buildOnePieceDarkTheme(),
      darkTheme: buildOnePieceDarkTheme(),
      themeMode: ThemeMode.dark,
      routerConfig: appRouter, // connect GoRouter here
    );
  }
}
