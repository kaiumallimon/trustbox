import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustbox/app/providers.dart';
import 'package:trustbox/app/trustbox_router.dart';
import 'package:trustbox/app/trustbox_theme.dart';

class TrustBoxApp extends StatelessWidget {
  const TrustBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp.router(
        title: 'TrustBox',
        theme: TrustboxTheme().getTheme(),
        darkTheme: TrustboxTheme().getDarkTheme(),
        themeMode: ThemeMode.system,
        routerConfig: getRouter,
      ),
    );
  }
}
