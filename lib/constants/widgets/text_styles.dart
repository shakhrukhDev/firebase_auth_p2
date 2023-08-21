import 'package:firebase_auth_p2/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  AppStyle._();

  static TextStyle get poppins32xW500White => GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 32,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      );

  static TextStyle get poppins22xW500Black => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 22,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins14xW300Gray => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.gray,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
  );
  static TextStyle get poppins14xW400Black => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.black,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins16xW300Black => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins20xW400Black => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 20,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins14xW500White => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins12xW400Red => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 12,
      color: AppColors.red,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins12xW300Gray => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 12,
      color: AppColors.gray,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins12xW400Gray => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 12,
      color: AppColors.gray,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins14xW400Gray => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.gray,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get poppins14xW600Red => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.red,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
  );
}
