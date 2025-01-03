import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/navigation_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.theme,
  });

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
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
              label: 'Generate',
            ),
          ],
        );
      },
    );
  }
}
