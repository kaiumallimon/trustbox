import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustbox/repositories/auth_repository.dart';

import '../models/auth_response_model.dart';

// auth state

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignedIn extends AuthState {
  final User user;
  AuthSignedIn(this.user);
}

class AuthSignedOut extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

// auth cubit

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  // Check if the user is already signed in
  Future<void> checkUserStatus() async {
    try {
      final User? user = authRepository.getCurrentUser();
      if (user != null) {
        print('User is signed in');
        emit(AuthSignedIn(user));
      } else {
        print('User is signed out');
        emit(AuthSignedOut());
      }
    } catch (e) {
      emit(AuthError("Error checking user status: $e"));
    }
  }

  // Sign in using Google
  Future<void> signInWithGoogle() async {
    emit(AuthLoading()); // Show loading state while signing in
    final AuthResponseModel response = await authRepository.signInWithGoogle();

    if (response.user != null) {
      print('User signed in: ${response.user!.displayName}');
      emit(AuthSignedIn(response.user!));
    } else {
      print('Error signing in: ${response.message}');
      emit(AuthError(response.message));
    }
  }

  // Sign out the user
  Future<void> signOut() async {
    try {
      await authRepository.signOut();
      emit(AuthSignedOut());
    } catch (e) {
      emit(AuthError("Error signing out: $e"));
    }
  }
}
