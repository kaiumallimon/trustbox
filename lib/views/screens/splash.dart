// splash screen
import 'package:flutter/material.dart';
import 'package:trustbox/utils/statusbar_navbar_color.dart';
import 'package:trustbox/views/widgets/custom_loading_animation.dart';

import '../widgets/splash_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;

    // set status bar color and navigation bar color
    setStatusBarColor(theme);

    return Scaffold(
      backgroundColor: theme.surface,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // splash logo
          const Positioned.fill(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(child: SplashLogo(size: 100))),

          // loading indicator
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: CustomLoadingAnimation(size: 25, color: theme.primary))
        ],
      ),
    );
  }
}
