// lib/themes/app_themes.dart
import 'package:flutter/material.dart';

class AppThemes {
  // 定义通用的基础文字主题
// 定义通用的基础文字主题，整体字体缩小
  static const TextTheme baseTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),      // 大标题
    displayMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),     // 中标题
    displaySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),      // 小标题

    headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),     // 页面标题
    headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),    // 中等标题
    headlineSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),     // 小标题

    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),        // 大文本标题
    titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),       // 中文本标题
    titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),        // 小文本标题

    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),       // 主体内容文字
    bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),      // 普通内容文字
    bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),       // 小号内容文字

    labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),        // 大号标签文字
    labelMedium: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),       // 中号标签文字
    labelSmall: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),         // 小号标签文字
  );


  // 浅色主题配置
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,              // 主色调
      onPrimary: Colors.white,            // 按钮文本色或前景色
      secondary: Colors.blueAccent,       // 辅助色
      onSecondary: Colors.white,          // 辅助色前景色
      background: Colors.white,           // 背景色
      onBackground: Colors.black87,        // 背景上的文本色
      surface: Color(0xFFF1F1F1),          // 表面色（用于卡片、按钮等）
      onSurface: Colors.black54,           // 表面上的文本色
    ),
    scaffoldBackgroundColor: Colors.white,  // 脚手架背景色

    // AppBar 样式
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,      // AppBar 背景色
      foregroundColor: Colors.black,      // AppBar 前景色（图标、文本等）
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    // BottomNavigationBar 样式
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,              // 底部导航栏背景色
      selectedItemColor: Colors.blue,             // 选中项的颜色
      unselectedItemColor: Colors.grey,           // 未选中项的颜色
      selectedLabelStyle: TextStyle(fontSize: 10), // 选中项的文本样式
      unselectedLabelStyle: TextStyle(fontSize: 10), // 未选中项的文本样式
    ),

    // FloatingActionButton 样式
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,     // 按钮背景色
      foregroundColor: Colors.white,    // 按钮前景色（图标色）
    ),

    // Card 样式
    cardTheme: const CardTheme(
      color: Color(0xFFF5F5F5),         // 卡片背景色
      elevation: 2,
    ),

    // SnackBar 样式
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.blueAccent,   // SnackBar 背景色
      contentTextStyle: TextStyle(color: Colors.white),
    ),

    // Dialog 样式
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      contentTextStyle: TextStyle(color: Colors.black87),
    ),

    textTheme: _lightTextTheme,  // 使用自定义的文字主题
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // 按钮背景色 (替代 primary)
        foregroundColor: Colors.white, // 按钮前景色 (替代 onPrimary)
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF1F1F1), // 输入框背景色
      border: OutlineInputBorder(),
    ),
  );

  // 暗黑主题配置
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,               // 主色调
      onPrimary: Colors.black,            // 按钮前景色
      secondary: Colors.blueAccent,       // 辅助色
      onSecondary: Colors.black,          // 辅助色前景色
      background: Color(0xFF121212),      // 背景色
      onBackground: Colors.white,         // 背景上的文本色
      surface: Color(0xFF1F1F1F),         // 表面色（用于卡片、按钮等）
      onSurface: Colors.white70,          // 表面上的文本色
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1F1F1F),
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.white54,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,     // 按钮背景色
      foregroundColor: Colors.black,    // 按钮前景色（图标色）
    ),

    cardTheme: const CardTheme(
      color: Color(0xFF2C2C2C),         // 卡片背景色
      elevation: 2,
    ),

    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.blueAccent,   // SnackBar 背景色
      contentTextStyle: TextStyle(color: Colors.black),
    ),

    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF2C2C2C),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      contentTextStyle: TextStyle(color: Colors.white70),
    ),

    textTheme: _darkTextTheme,  // 使用自定义的文字主题
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // 按钮背景色 (替代 primary)
        foregroundColor: Colors.black, // 按钮前景色 (替代 onPrimary)
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF303030), // 输入框背景色
      border: OutlineInputBorder(),
    ),
  );

  // 定义浅色和暗黑主题下的文字主题，基于基础文字主题
  static final TextTheme _lightTextTheme = baseTextTheme.copyWith(
    displayLarge: baseTextTheme.displayLarge!.copyWith(color: Colors.black),
  );

  static final TextTheme _darkTextTheme = baseTextTheme.copyWith(
    displayLarge: baseTextTheme.displayLarge!.copyWith(color: Colors.white),
  );
}
