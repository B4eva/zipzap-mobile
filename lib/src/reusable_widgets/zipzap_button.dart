import 'package:flutter/material.dart';
import 'package:zipzap/src/app_colors.dart';

class ZipzapButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const ZipzapButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          minimumSize: const Size(double.infinity, 70.0), // Fixed height
        ),
        onPressed: onPressed,
        child: Center(child: child),
      ),
    );
  }
}
