import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/navigation_bloc.dart';
import '../../utils/statusbar_navbar_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;

    // set status bar color
    setStatusBarColor2(theme);

    return Scaffold(
      backgroundColor: theme.surface,
      body: const Center(
        child: Text('Home Screen'),
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          return NavigationBar(
            surfaceTintColor: theme.inversePrimary,
            selectedIndex: selectedIndex,
            indicatorColor: theme.primaryContainer,
            onDestinationSelected: (index) {
              context
                  .read<NavigationCubit>()
                  .setIndex(index); // Update selected index
            },
            destinations: const <NavigationDestination>[
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.shuffle),
                label: 'Generate Pass',
              ),
            ],
          );
        },
      ),
    );
  }
}
