import 'package:barcode_generator/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get appbartheme {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors().white,
    ),
  );
}

TextStyle get subHeadingTheme {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(color: AppColors().grey, fontSize: 18),
  );
}

TextStyle get texttheme {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontWeight: FontWeight.bold, color: AppColors().white, fontSize: 20),
  );
}

TextStyle get hintTexttheme {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: AppColors().white,
      fontSize: 16,
    ),
  );
}

TextStyle get labletheme {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: AppColors().white,
      fontSize: 16,
    ),
  );
}

TextStyle get inputTheme {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: AppColors().white,
      fontSize: 16,
    ),
  );
}

TextStyle get buttonTheme {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: AppColors().orange,
        fontSize: 15,
        decoration: TextDecoration.underline,
        decorationColor: AppColors().orange),
  );
}

TextStyle get elevatedButtonTheme {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: AppColors().orange,
    ),
  );
}


TextStyle get radioButtonTheme{
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: AppColors().white,
      fontSize: 14
    ),
  );
}
