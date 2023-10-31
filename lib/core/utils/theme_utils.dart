import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeUtils {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    // Define the default brightness and colors.
    
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.inter(),
      displaySmall: GoogleFonts.inter(),
    ),
  );
}
