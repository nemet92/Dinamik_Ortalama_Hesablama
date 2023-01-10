import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;
  static const String baslikText = "Ortalama Hesaplama";

  static final TextStyle basliqStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle ortalamaGosterBodySayisiStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);

  static final TextStyle ortalamaSayisiStyle = GoogleFonts.quicksand(
      fontSize: 56, fontWeight: FontWeight.w600, color: anaRenk);

  static const EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static const yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
