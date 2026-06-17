import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  AppTheme._();

  static const Color primaryColor = CupertinoColors.systemBlue;
  static const Color accentColor = CupertinoColors.systemBlue;
  static const Color textPrimary = CupertinoColors.black;

  static const TextStyle bodyStyle = TextStyle(fontSize: 16, color: textPrimary);

  static const LinearGradient sunsetGradient = LinearGradient(
    colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
    begin: Alignment.topLeading,
    end: Alignment.bottomTrailing,
  );
}
