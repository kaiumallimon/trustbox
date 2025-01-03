import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/splash_bloc.dart';

final providers = [
  // splash bloc
  BlocProvider<SplashBloc>(
    create: (context) => SplashBloc(),
  ),
];
