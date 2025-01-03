import 'package:flutter/material.dart';

import '../widgets/add_password_button.dart';
import '../widgets/passwords_screen_body.dart';

class PasswordsScreen extends StatelessWidget {
  const PasswordsScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: PasswordScreenBody(
        theme: theme,
        scaffoldKey: scaffoldKey,
      ),
      floatingActionButton: AddPasswordButton(theme: theme),
    );
  }
}
