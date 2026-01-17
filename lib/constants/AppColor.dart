// ignore: file_names
import 'package:flutter/material.dart';
class AppColor {
  AppColor._();

// background color
  static const Color backgroundColor = Color(0xFFFFFFFF);
  // btn background color
  static const Color btnBackgroundColor = Color(0xFF8E6CEF);
  static const Color btnTextColor = Color(0xFFFFFFFF);


  // input placeholder 
  static const Color inputPlaceholder = Color(0xFF272727);

  // input BG
  static const Color inputBg= Color(0xFFF4F4F4);
// text
static const Color textColor = Color(0xFF272727);

static InputDecoration inputDecoration(String hint){
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color.fromARGB(255, 244, 244, 244),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.transparent),
      ),
    );
  }
}