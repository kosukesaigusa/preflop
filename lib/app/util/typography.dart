import 'package:flutter/material.dart';

/// アプリで使用するテキストスタイルから定義された [TextTheme].
const appTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 57,
    height: 64 / 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.25,
    color: Color(0xFF111111),
  ),
  displayMedium: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 45,
    height: 52 / 45,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: Color(0xFF111111),
  ),
  displaySmall: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: Color(0xFF111111),
  ),
  headlineLarge: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: Color(0xFF111111),
  ),
  headlineMedium: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: Color(0xFF111111),
  ),
  headlineSmall: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: Color(0xFF111111),
  ),
  titleLarge: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: Color(0xFF111111),
  ),
  titleMedium: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: Color(0xFF111111),
  ),
  titleSmall: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: Color(0xFF111111),
  ),
  labelLarge: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: Color(0xFF111111),
  ),
  labelMedium: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: Color(0xFF111111),
  ),
  labelSmall: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: Color(0xFF111111),
  ),
  bodyLarge: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.5,
    color: Color(0xFF111111),
  ),
  bodyMedium: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.25,
    color: Color(0xFF111111),
  ),
  bodySmall: TextStyle(
    fontFamily: 'NotoSansJP',
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.4,
    color: Color(0xFF111111),
  ),
);

/// [BuildContext] 型の拡張クラス。
extension BuildContextExtension on BuildContext {
  /// 64 / 57 / Light の [TextStyle].
  TextStyle get displayLarge => appTextTheme.displayLarge!;

  /// 52 / 45 / Light の [TextStyle].
  TextStyle get displayMedium => appTextTheme.displayMedium!;

  /// 44 / 36 / Light の [TextStyle].
  TextStyle get displaySmall => appTextTheme.displaySmall!;

  /// 40 / 32 / Light の [TextStyle].
  TextStyle get headlineLarge => appTextTheme.headlineLarge!;

  /// 36 / 28 / Light の [TextStyle].
  TextStyle get headlineMedium => appTextTheme.headlineMedium!;

  /// 32 / 24 / Light の [TextStyle].
  TextStyle get headlineSmall => appTextTheme.headlineSmall!;

  /// 28 / 22 / SemiBold の [TextStyle].
  TextStyle get titleLarge => appTextTheme.titleLarge!;

  /// 24 / 16 / SemiBold の [TextStyle].
  TextStyle get titleMedium => appTextTheme.titleMedium!;

  /// 20 / 14 / SemiBold の [TextStyle].
  TextStyle get titleSmall => appTextTheme.titleSmall!;

  /// 20 / 14 / SemiBold の [TextStyle].
  TextStyle get labelLarge => appTextTheme.labelLarge!;

  /// 16 / 12 / SemiBold の [TextStyle].
  TextStyle get labelMedium => appTextTheme.labelMedium!;

  /// 16 / 11 / SemiBold の [TextStyle].
  TextStyle get labelSmall => appTextTheme.labelSmall!;

  /// 24 / 16 / Light の [TextStyle].
  TextStyle get bodyLarge => appTextTheme.bodyLarge!;

  /// 20 / 14 / Light の [TextStyle].
  TextStyle get bodyMedium => appTextTheme.bodyMedium!;

  /// 16 / 12 / Light の [TextStyle].
  TextStyle get bodySmall => appTextTheme.bodySmall!;
}
