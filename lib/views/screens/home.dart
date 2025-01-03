import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustbox/views/screens/generate_pass_screen.dart';
import 'package:trustbox/views/screens/passwords_screen.dart';

import '../../blocs/navigation_bloc.dart';
import '../../utils/statusbar_navbar_color.dart';
import '../widgets/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;

    // set status bar color
    setStatusBarColor2(theme);

    // define scaffold key
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: theme.surface,
      key: scaffoldKey,
      body: BlocBuilder<NavigationCubit, int>(builder: (context, state) {
        switch (state) {
          case 0:
            return PasswordsScreen(
              scaffoldKey: scaffoldKey,
            );
          case 1:
            return GeneratePassScreen();
          default:
            return const Center(
              child: Text('Home Screen'),
            );
        }
      }),
      bottomNavigationBar: CustomBottomNavigationBar(theme: theme),
      drawer: const Drawer(),
    );
  }
}
