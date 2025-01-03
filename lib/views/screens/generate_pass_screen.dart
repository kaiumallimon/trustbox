import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustbox/blocs/pass_generator_bloc.dart';

import '../../utils/alert_util.dart';
import '../widgets/password_generator_params.dart';

class GeneratePassScreen extends StatelessWidget {
  const GeneratePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Generate Password',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.primary),
            ),
            const SizedBox(height: 20),

            // Password options
            Expanded(
              child:
                  BlocBuilder<PasswordGenerationBloc, PasswordGenerationState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Parameters Section
                        Text('Parameters',
                            style: TextStyle(
                                color: theme.primary,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),

                        // Length Slider (Example)
                        passwordLengthSlider(theme, state, context),

                        const SizedBox(height: 10),

                        // Include Numbers
                        passwordNumberSelector(theme, state, context),

                        const SizedBox(height: 10),

                        // Include Lowercase Letters
                        passwordLowerCaseSelector(theme, state, context),

                        const SizedBox(height: 10),

                        // Include Uppercase Letters
                        passwordUpperCaseSelector(theme, state, context),

                        const SizedBox(height: 10),

                        // Include Special Characters
                        passwordSpecialCharacterSelector(theme, state, context),

                        const SizedBox(height: 20),

                        // Generated Password and Buttons
                        if (state.generatedPassword == null) ...[
                          // Show Generate Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<PasswordGenerationBloc>()
                                      .add(GeneratePassword());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.primary,
                                  foregroundColor: theme.onPrimary,
                                ),
                                child: const Text('Generate Password'),
                              ),
                            ],
                          ),
                        ] else ...[
                          // Show Clear Button and Generated Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<PasswordGenerationBloc>()
                                      .add(ClearPassword());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.error,
                                  foregroundColor: theme.onError,
                                ),
                                child: Text('Clear'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Generated Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme.primary),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: theme.primaryContainer,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              title: Text(
                                state.generatedPassword!,
                                style: TextStyle(
                                    color: theme.onSurface,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.copy,
                                  color: theme.primary,
                                ),
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                      text: state.generatedPassword!));

                                  showConfirmAlert(context,
                                      "Password copied to the clipboard, Do you want to save it?",
                                      () {
                                    // show bottom sheet to save password
                                  });
                                },
                              ),
                            ),
                          ),
                        ],

                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
