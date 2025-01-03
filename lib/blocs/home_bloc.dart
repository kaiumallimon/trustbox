import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustbox/repositories/auth_repository.dart';

@immutable
abstract class HomeEvent {}

class GetHomeData extends HomeEvent {}

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String? image;

  HomeLoaded(this.image);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetHomeData>((event, emit) async {
      emit(HomeLoading());
      try {
        await Future.delayed(Duration(seconds: 2));

        User? user = AuthRepository().getCurrentUser();

        if (user != null) {
          emit(HomeLoaded(user.photoURL));
        } else {
          emit(HomeError('User not found'));
        }
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
