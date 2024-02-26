// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color theme_color = Colors.purple;

TextStyle main_style = GoogleFonts.abhayaLibre(
  color: Colors.black,
  fontWeight: FontWeight.w900,
  fontSize: 25,
);

TextStyle button_style = GoogleFonts.abhayaLibre(
  color: theme_color,
  fontWeight: FontWeight.bold,
  fontSize: 25,
);
TextStyle black_style = GoogleFonts.abhayaLibre(
  color: Colors.black,
  fontWeight: FontWeight.w900,
  fontSize: 18,
);

TextStyle hint_style = GoogleFonts.abhayaLibre(
  color: theme_color,
  fontWeight: FontWeight.w900,
  fontSize: 20,
);
TextStyle heading_style =
    GoogleFonts.breeSerif(fontWeight: FontWeight.w900, fontSize: 40);

SizedBox space = SizedBox(height: 10);
SizedBox spacewidth = SizedBox(width: 10);
