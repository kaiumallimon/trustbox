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
