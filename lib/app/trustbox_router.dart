import 'package:go_router/go_router.dart';
import 'package:trustbox/views/screens/splash.dart';

GoRouter getRouter = GoRouter(
    initialLocation: '/', // Initial route when the app starts
    routes: [
      // Define the login screen route
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      
    ],
  );