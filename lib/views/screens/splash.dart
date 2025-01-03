import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustbox/utils/alert_util.dart';
import 'package:trustbox/utils/statusbar_navbar_color.dart';
import 'package:trustbox/views/widgets/custom_loading_animation.dart';
import 'package:trustbox/views/widgets/splash_logo.dart';

import '../../blocs/auth_bloc.dart'; // Replace with your actual Home screen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get theme and set status bar color and navigation bar color
    final theme = Theme.of(context).colorScheme;
    setStatusBarColor(theme);

    // Check user status when the splash screen is loaded
    context.read<AuthCubit>().checkUserStatus();

    return Scaffold(
      backgroundColor: theme.surface,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSignedIn) {
            // Navigate to the Home screen when the user is signed in
          } else if (state is AuthSignedOut) {
            // try to sign in the user
            context.read<AuthCubit>().signInWithGoogle();
          } else if (state is AuthError) {
            // Handle error state, show message to user
            showErrorAlert(context, state.message, null);
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Splash logo
            const Positioned.fill(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(child: SplashLogo(size: 100)),
            ),
            // Loading indicator
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: CustomLoadingAnimation(size: 25, color: theme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
