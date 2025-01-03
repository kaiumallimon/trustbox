import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordGenerationState {
  final bool includeNumbers;
  final bool includeLowercase;
  final bool includeUppercase;
  final bool includeSpecialChars;
  final int length;
  final String? generatedPassword;

  PasswordGenerationState({
    required this.includeNumbers,
    required this.includeLowercase,
    required this.includeUppercase,
    required this.includeSpecialChars,
    required this.length,
    this.generatedPassword,
  });

  PasswordGenerationState copyWith({
    bool? includeNumbers,
    bool? includeLowercase,
    bool? includeUppercase,
    bool? includeSpecialChars,
    int? length,
    String? generatedPassword,
  }) {
    return PasswordGenerationState(
      includeNumbers: includeNumbers ?? this.includeNumbers,
      includeLowercase: includeLowercase ?? this.includeLowercase,
      includeUppercase: includeUppercase ?? this.includeUppercase,
      includeSpecialChars: includeSpecialChars ?? this.includeSpecialChars,
      length: length ?? this.length,
      generatedPassword: generatedPassword ?? this.generatedPassword,
    );
  }
}

abstract class PasswordGenerationEvent {}

class UpdateIncludeNumbers extends PasswordGenerationEvent {
  final bool value;
  UpdateIncludeNumbers(this.value);
}

class UpdateIncludeLowercase extends PasswordGenerationEvent {
  final bool value;
  UpdateIncludeLowercase(this.value);
}

class UpdateIncludeUppercase extends PasswordGenerationEvent {
  final bool value;
  UpdateIncludeUppercase(this.value);
}

class UpdateIncludeSpecialChars extends PasswordGenerationEvent {
  final bool value;
  UpdateIncludeSpecialChars(this.value);
}

class UpdateLength extends PasswordGenerationEvent {
  final int value;
  UpdateLength(this.value);
}

class GeneratePassword extends PasswordGenerationEvent {}

class ClearPassword extends PasswordGenerationEvent {}

// The Bloc that handles the password generation logic
class PasswordGenerationBloc
    extends Bloc<PasswordGenerationEvent, PasswordGenerationState> {
  PasswordGenerationBloc()
      : super(PasswordGenerationState(
          includeNumbers: true,
          includeLowercase: true,
          includeUppercase: true,
          includeSpecialChars: true,
          length: 12,
          generatedPassword: null, // Initially no password generated
        )) {
    on<UpdateIncludeNumbers>((event, emit) {
      emit(state.copyWith(includeNumbers: event.value));
    });

    on<UpdateIncludeLowercase>((event, emit) {
      emit(state.copyWith(includeLowercase: event.value));
    });

    on<UpdateIncludeUppercase>((event, emit) {
      emit(state.copyWith(includeUppercase: event.value));
    });

    on<UpdateIncludeSpecialChars>((event, emit) {
      emit(state.copyWith(includeSpecialChars: event.value));
    });

    on<UpdateLength>((event, emit) {
      emit(state.copyWith(length: event.value));
    });

    on<GeneratePassword>((event, emit) {
      final password = _generatePassword();
      emit(state.copyWith(generatedPassword: password));
    });

    on<ClearPassword>((event, emit) {
      emit(PasswordGenerationState(
        includeNumbers: true,
        includeLowercase: true,
        includeUppercase: true,
        includeSpecialChars: true,
        length: 12,
        generatedPassword: null, // Initially no password generated
      )); // Reset password
    });
  }

  String _generatePassword() {
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const specialChars = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

    String availableChars = '';
    if (state.includeLowercase) availableChars += lowercase;
    if (state.includeUppercase) availableChars += uppercase;
    if (state.includeNumbers) availableChars += numbers;
    if (state.includeSpecialChars) availableChars += specialChars;

    if (availableChars.isEmpty) return '';

    final random = Random();
    String password = '';
    for (int i = 0; i < state.length; i++) {
      password += availableChars[random.nextInt(availableChars.length)];
    }

    return password;
  }
}
