import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const LogoWidget({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logos/zipzap-logo.png',
      height: height,
      width: width,
    );
  }
}
