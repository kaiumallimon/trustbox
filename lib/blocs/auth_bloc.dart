import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustbox/repositories/auth_repository.dart';
import 'package:trustbox/models/auth_response_model.dart';

// AuthBloc Class

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    // Handle events and emit states
    on<CheckUserStatus>(_onCheckUserStatus);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<SignOut>(_onSignOut);
  }

  // Check if the user is already signed in
  Future<void> _onCheckUserStatus(
      CheckUserStatus event, Emitter<AuthState> emit) async {
    try {
      final User? user = authRepository.getCurrentUser();
      if (user != null) {
        emit(AuthSignedIn(user));
      } else {
        emit(AuthSignedOut());
      }
    } catch (e) {
      emit(AuthError("Error checking user status: $e"));
    }
  }

  // Sign in using Google
  Future<void> _onSignInWithGoogle(
      SignInWithGoogle event, Emitter<AuthState> emit) async {
    emit(AuthLoading()); // Show loading state while signing in
    try {
      final AuthResponseModel response =
          await authRepository.signInWithGoogle();

      if (response.user != null) {
        emit(AuthSignedIn(response.user!));
      } else {
        emit(AuthError(response.message));
      }
    } catch (e) {
      emit(AuthError("Error signing in: $e"));
    }
  }

  // Sign out the user
  Future<void> _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    try {
      await authRepository.signOut();
      emit(AuthSignedOut());
    } catch (e) {
      emit(AuthError("Error signing out: $e"));
    }
  }
}

@immutable
abstract class AuthEvent {}

class CheckUserStatus extends AuthEvent {}

class SignInWithGoogle extends AuthEvent {}

class SignOut extends AuthEvent {}

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
