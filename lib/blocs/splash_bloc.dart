import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// splash events
abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class SplashStarted extends SplashEvent {
  const SplashStarted();

  @override
  List<Object> get props => [];
}

// splash states
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {
  const SplashInitial();

  @override
  List<Object> get props => [];
}

class SplashSuccess extends SplashState {
  const SplashSuccess();

  @override
  List<Object> get props => [];
}

class SplashFailure extends SplashState {
  const SplashFailure();

  @override
  List<Object> get props => [];
}

// splash bloc
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
      SplashStarted event, Emitter<SplashState> emit) async {
    try {
      // add a delay of 2 seconds
      await Future.delayed(const Duration(seconds: 2));

      emit(const SplashSuccess());
    } catch (e) {
      emit(const SplashFailure());
    }
  }
}
