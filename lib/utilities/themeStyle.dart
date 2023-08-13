// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'themeColors.dart';

class ThemeStyles {
  static TextStyle primaryTitle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: ThemeColors.black,
  );
  static TextStyle seeAll = TextStyle(
    fontSize: 17.0,
    color: ThemeColors.black,
  );
  static TextStyle cardDetails = GoogleFonts.inconsolata(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  static TextStyle cardMoney = const TextStyle(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle tagText = TextStyle(
    fontStyle: FontStyle.italic,
    color: ThemeColors.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle otherDetailsPrimary = TextStyle(
    fontSize: 16.0,
    color: ThemeColors.black,
  );
  static TextStyle otherDetailsSecondary = const TextStyle(
    fontSize: 12.0,
    color: Colors.grey,
  );
}
