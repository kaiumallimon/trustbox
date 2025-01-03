import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/home_bloc.dart';
import '../blocs/navigation_bloc.dart';
import '../blocs/splash_bloc.dart';
import '../repositories/auth_repository.dart';

final providers = [
  // splash bloc
  BlocProvider<SplashBloc>(
    create: (context) => SplashBloc(),
  ),

  // auth bloc
  BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(AuthRepository()),
  ),


  // navigation cubit
  BlocProvider<NavigationCubit>(
    create: (context) => NavigationCubit(),
  ),

  // home bloc
  BlocProvider<HomeBloc>(
    create: (context) => HomeBloc(),
  ),
];
