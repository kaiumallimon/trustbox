import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/pass_generator_bloc.dart';

Container passwordSpecialCharacterSelector(
      ColorScheme theme, PasswordGenerationState state, BuildContext context) {
    return customTileContainer(
      theme,
      CheckboxListTile(
        title: const Text('Include Special Characters'),
        value: state.includeSpecialChars,
        onChanged: (value) {
          context
              .read<PasswordGenerationBloc>()
              .add(UpdateIncludeSpecialChars(value!));
        },
      ),
    );
  }

  Container passwordUpperCaseSelector(
      ColorScheme theme, PasswordGenerationState state, BuildContext context) {
    return customTileContainer(
      theme,
      CheckboxListTile(
        title: const Text('Include Uppercase Letters'),
        value: state.includeUppercase,
        onChanged: (value) {
          context
              .read<PasswordGenerationBloc>()
              .add(UpdateIncludeUppercase(value!));
        },
      ),
    );
  }

  Container passwordLowerCaseSelector(
      ColorScheme theme, PasswordGenerationState state, BuildContext context) {
    return customTileContainer(
        theme,
        CheckboxListTile(
          title: const Text('Include Lowercase Letters'),
          value: state.includeLowercase,
          onChanged: (value) {
            context
              .read<PasswordGenerationBloc>()
              .add(UpdateIncludeLowercase(value!));
          },
        ));
  }

  Container passwordNumberSelector(
      ColorScheme theme, PasswordGenerationState state, BuildContext context) {
    return customTileContainer(
      theme,
      CheckboxListTile(
        title: const Text('Include Numbers'),
        value: state.includeNumbers,
        onChanged: (value) {
          context.read<PasswordGenerationBloc>().add(UpdateIncludeNumbers(value!));
        },
      ),
    );
  }

  Container passwordLengthSlider(
      ColorScheme theme, PasswordGenerationState state, BuildContext context) {
    return customTileContainer(
      theme,
      SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Password Length',
                    style: TextStyle(
                        color: theme.primary, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    min: 6,
                    max: 20,
                    divisions: 14,
                    value: state.length.toDouble(),
                    onChanged: (value) {
                      context
                          .read<PasswordGenerationBloc>()
                          .add(UpdateLength(value.toInt()));
                    },
                  ),
                ),
                Text('${state.length}',
                    style: TextStyle(
                        color: theme.primary, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }


Container customTileContainer(ColorScheme theme, Widget child) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: theme.surfaceContainer,
      borderRadius: BorderRadius.circular(10),
    ),
    child: child,
  );
}
