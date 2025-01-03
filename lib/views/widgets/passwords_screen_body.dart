import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustbox/views/widgets/custom_loading_animation.dart';

import '../../blocs/home_bloc.dart';
import 'passwords_screen_appbar.dart';

class PasswordScreenBody extends StatelessWidget {
  final ColorScheme theme;
  const PasswordScreenBody({
    super.key,
    required this.theme,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    //load home data
    BlocProvider.of<HomeBloc>(context).add(GetHomeData());

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return CustomLoadingAnimation(size: 25, color: theme.primary);
        }

        if (state is HomeError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is HomeLoaded) {
          return SafeArea(
              child: CustomScrollView(
            slivers: <Widget>[
              passwordsScreenAppBar(theme, state, scaffoldKey),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ],
          ));
        }

        return Container();
      },
    );
  }
}
