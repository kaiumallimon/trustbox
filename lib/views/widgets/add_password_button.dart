import 'package:flutter/material.dart';

class AddPasswordButton extends StatelessWidget {
  const AddPasswordButton({
    super.key,
    required this.theme,
  });

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: theme.primaryContainer,
    );
  }
}
