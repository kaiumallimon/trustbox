import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trustbox/utils/alert_util.dart';
import 'package:trustbox/utils/statusbar_navbar_color.dart';
import 'package:trustbox/views/widgets/custom_loading_animation.dart';
import 'package:trustbox/views/widgets/splash_logo.dart';

import '../../blocs/auth_bloc.dart'; // Replace with your actual Auth Bloc

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    setStatusBarColor(theme);

    // Dispatch the CheckUserStatus event to check user status
    // Delay for 2 seconds before dispatching the event
    Future.delayed(const Duration(seconds: 2), () {
      // Dispatch the CheckUserStatus event after 2 seconds
      context.read<AuthBloc>().add(CheckUserStatus());
    });

    return Scaffold(
      backgroundColor: theme.surface,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignedIn) {
            // Navigate to the Home screen when the user is signed in
            GoRouter.of(context).go('/home');
          } else if (state is AuthSignedOut) {
            // Prompt the user to sign in using Google
            context.read<AuthBloc>().add(SignInWithGoogle());
          } else if (state is AuthError) {
            // Handle error state, show message to user
            showErrorAlert(context, state.message, null);
          }
        },
        builder: (context, state) {
          return Stack(
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
              // Loading indicator while signing in
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: CustomLoadingAnimation(size: 25, color: theme.primary),
              ),
            ],
          );
        },
      ),
    );
  }
}
