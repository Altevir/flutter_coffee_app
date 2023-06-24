import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static AppTextStyles? _instance;

  AppTextStyles._();

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();

    return _instance!;
  }

  String get font => GoogleFonts.poppins().fontFamily!;

  TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: font,
      );

  TextStyle get textMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: font,
      );

  TextStyle get textSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: font,
      );

  TextStyle get textBold => TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: font,
      );

  TextStyle get textButtonLabel => textBold.copyWith(
        fontSize: 14,
      );
}

extension TextStylesExtension on BuildContext {
  AppTextStyles get textStyles => AppTextStyles.instance;
}
