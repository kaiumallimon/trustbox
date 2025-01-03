import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/icon.png',
        width: size, height: size, fit: BoxFit.contain);
  }
}
