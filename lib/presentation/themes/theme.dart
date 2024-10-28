import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kDefaultPadding = 20.0;

const kPrimaryLight = Colors.black;
const kPrimaryDark = Colors.white; 
const kSecondary = Colors.lightBlue; 
const kContentLight =
    Color(0xFF1C1C1E);
const kContentDark = Colors.white;
const kBackgroundLight = Color(0xFFF5F5F7);
const kBackgroundDark = Color(0xFF121212);

// ThemeData with Consistent Structure and Accessibility Considerations
ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
    brightness: Brightness.light,
    primaryColor: kPrimaryLight,
    scaffoldBackgroundColor: kBackgroundLight,
    appBarTheme: appBarTheme.copyWith(
      color: kBackgroundLight, // AppBar background matches light theme
      centerTitle: true,
      iconTheme:
         const IconThemeData(color: kPrimaryLight), // Icons match primary color
      titleTextStyle: GoogleFonts.inter(
        color: kContentLight,
        fontWeight: FontWeight.normal,
        fontSize: 19,
      ),
    ),
    iconTheme: const IconThemeData(color: kPrimaryLight), // Consistent icon color
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(
          bodyColor: kContentLight,
          displayColor: kContentLight,
        )
        .copyWith(
          titleMedium:
             const TextStyle(color: Colors.black), // Maintain black for subtitles
        ),
    listTileTheme: const ListTileThemeData(
      subtitleTextStyle:
          TextStyle(color: Colors.black54), // Consistent subtitle color
    ),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryLight,
      secondary: kSecondary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kBackgroundLight, // Matches light theme background
      selectedItemColor: kPrimaryLight, // Matches primary color
      unselectedItemColor: kContentLight.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryLight),
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[200], // Light background for input fields
      hintStyle: TextStyle(
        color: Colors.grey[600], // Hint text with decent contrast
      ),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
          splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    primaryColor: kPrimaryDark,
    scaffoldBackgroundColor: kBackgroundDark,
    appBarTheme: appBarTheme.copyWith(
      color: kBackgroundDark, // AppBar background matches dark theme
      centerTitle: true,
      iconTheme: const IconThemeData(color: kPrimaryDark),
      titleTextStyle: GoogleFonts.inter(
        color: kContentDark,
      ),
    ),
    iconTheme: const IconThemeData(color: kPrimaryDark), // Consistent icon color
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(
          bodyColor: kContentDark,
          displayColor: kContentDark,
        )
        .copyWith(
          titleMedium:
             const TextStyle(color: Colors.white), // Maintain white for subtitles
        ),
    listTileTheme: const ListTileThemeData(
      subtitleTextStyle:
          TextStyle(color: Colors.white54), // Consistent subtitle color
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryDark,
      secondary: kSecondary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kBackgroundDark, // Matches dark theme background
      selectedItemColor: Colors.white70, // Lighter primary for selection
      unselectedItemColor: kContentDark.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryDark),
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[800], // Adjust for better contrast in dark mode
      hintStyle: TextStyle(
        color: Colors.grey[400], // Hint text with decent contrast
      ),
    ),
  );
}

const appBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 1,
    shadowColor: Color.fromARGB(255, 234, 248, 255));