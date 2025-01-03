import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/splash_bloc.dart';
import '../repositories/auth_repository.dart';

final providers = [
  // splash bloc
  BlocProvider<SplashBloc>(
    create: (context) => SplashBloc(),
  ),

  // auth bloc
  BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(AuthRepository()),
  ),
];
