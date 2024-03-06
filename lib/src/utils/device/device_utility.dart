import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZipZapDeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color));
  }

  static bool isLandScapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;

    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;

    return viewInsets.bottom != 0;
  }

  static void setFullscreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersive : SystemUiMode.edgeToEdge);
  }

  // static double getScreenHeight() {
  //   return MediaQuery.of(Get.context).size.width;
  // }
}
