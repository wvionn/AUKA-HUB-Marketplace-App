import 'package:flutter/material.dart';

class AppColors {
  // Warna ungu dominan dari desain
  static const Color primaryPurple = Color(0xFF9C7CB8);
  static const Color darkPurple = Color(0xFF6A5496);
  static const Color lightPurple = Color(0xFFE6DFF0);
  static const Color textDark = Color(0xFF333333);
  static const Color textGrey = Color(0xFF888888);
  static const Color bgGrey = Color(0xFFF0F0F0); // Background abu-abu muda

  // Gradasi ungu untuk background
  static const LinearGradient purpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFBFA4D4), Color(0xFF8A6CA8)],
  );
}