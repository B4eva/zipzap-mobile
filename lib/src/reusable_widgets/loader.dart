import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zipzap/src/app_colors.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  double initialRaduis = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: SpinKitCircle(
            size: 140,
            duration: const Duration(seconds: 2),
            itemBuilder: (context, index) {
              final colors = [AppColors.primaryColor, Colors.white];
              final color = colors[index % colors.length];

              return DecoratedBox(
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle));
            },
          ),
        ),
      ),
    );
  }
}
