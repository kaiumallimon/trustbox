import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../blocs/home_bloc.dart';

SliverAppBar passwordsScreenAppBar(
    ColorScheme theme, HomeLoaded state, GlobalKey<ScaffoldState> scaffoldKey) {
  return SliverAppBar(
    backgroundColor: theme.surface,
    expandedHeight: 60.0,
    floating: true,
    pinned: true,
    title: GestureDetector(
      onTap: () {
        // open search screen
      },
      child: Center(
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: theme.primaryContainer,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: theme.onPrimaryContainer.withOpacity(.5),
                      fontSize: 16),
                ),
              ),

              // profile icon
              CircleAvatar(
                radius: 17,
                backgroundColor: theme.primaryContainer,
                backgroundImage: state.image != null
                    ? CachedNetworkImageProvider(state.image!)
                    : null,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
