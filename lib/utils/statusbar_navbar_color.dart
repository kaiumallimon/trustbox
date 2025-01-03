import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarColor(ColorScheme theme) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: theme.brightness,
    systemNavigationBarColor: theme.surface,
    systemNavigationBarIconBrightness: theme.brightness,
  ));
}

void setStatusBarColor2(ColorScheme theme) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: theme.brightness,
    systemNavigationBarColor: Color.alphaBlend(
      theme.primary.withOpacity(0.1), // Tint effect
      theme.surface,
    ),
    systemNavigationBarIconBrightness: theme.brightness,
  ));
}
