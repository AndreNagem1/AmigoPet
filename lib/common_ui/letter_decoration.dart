import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/app_colors.dart';

class AppStyles {
  static final TextStyle poppins18TextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 18,
      color: AppColors.letterColor,
    ),
  );
  static final TextStyle poppins14TextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14,
      color: AppColors.letterColor,
    ),
  );
  static final TextStyle poppins12TextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 12,
      color: AppColors.letterColor,
    ),
  );
  static final TextStyle poppins10TextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 10,
      color: AppColors.letterColor,
    ),
  );
  static final TextStyle poppins14W400TextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.letterColor,
    ),
  );
}
