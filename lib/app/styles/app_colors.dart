import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get instance {
    _instance ??= AppColors._();

    return _instance!;
  }

  Color get primary => const Color(0xffd27842);
  Color get secondary => const Color(0xff482615);
  Color get white => const Color(0xffffffff);
  Color get black => const Color(0xff000000);
  Color get greyF0 => const Color(0xffF0F0F0);
  Color get greyF8 => const Color(0xffF8F8F8);
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => AppColors.instance;
}
