import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'color.dart';
import 'gen/fonts.gen.dart';
import 'screen.dart';

/// アプリで使用するテキストスタイルから定義された [TextTheme].
const appTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 57,
    height: 64 / 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.25,
    color: AppColor.lightGrey,
  ),
  displayMedium: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 45,
    height: 52 / 45,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: AppColor.lightGrey,
  ),
  displaySmall: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: AppColor.lightGrey,
  ),
  headlineLarge: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: AppColor.lightGrey,
  ),
  headlineMedium: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: AppColor.lightGrey,
  ),
  headlineSmall: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: AppColor.lightGrey,
  ),
  titleLarge: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColor.lightGrey,
  ),
  titleMedium: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: AppColor.lightGrey,
  ),
  titleSmall: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColor.lightGrey,
  ),
  labelLarge: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColor.mediumGrey,
  ),
  labelMedium: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: AppColor.mediumGrey,
  ),
  labelSmall: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: AppColor.mediumGrey,
  ),
  bodyLarge: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.5,
    color: AppColor.lightGrey,
  ),
  bodyMedium: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.25,
    color: AppColor.lightGrey,
  ),
  bodySmall: TextStyle(
    fontFamily: FontFamily.notoSansJP,
    fontFamilyFallback: [FontFamily.notoColorEmoji],
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.4,
    color: AppColor.lightGrey,
  ),
);

/// [BuildContext] 型の拡張クラス。
extension BuildContextExtension on BuildContext {
  /// 64 / 57 / Light の [TextStyle].
  TextStyle get displayLarge => appTextTheme.displayLarge!.copyWith(
    fontSize: appTextTheme.displayLarge!.fontSize! * _screenWidthScale,
  );

  /// 52 / 45 / Light の [TextStyle].
  TextStyle get displayMedium => appTextTheme.displayMedium!.copyWith(
    fontSize: appTextTheme.displayMedium!.fontSize! * _screenWidthScale,
  );

  /// 44 / 36 / Light の [TextStyle].
  TextStyle get displaySmall => appTextTheme.displaySmall!.copyWith(
    fontSize: appTextTheme.displaySmall!.fontSize! * _screenWidthScale,
  );

  /// 40 / 32 / Light の [TextStyle].
  TextStyle get headlineLarge => appTextTheme.headlineLarge!.copyWith(
    fontSize: appTextTheme.headlineLarge!.fontSize! * _screenWidthScale,
  );

  /// 36 / 28 / Light の [TextStyle].
  TextStyle get headlineMedium => appTextTheme.headlineMedium!.copyWith(
    fontSize: appTextTheme.headlineMedium!.fontSize! * _screenWidthScale,
  );

  /// 32 / 24 / Light の [TextStyle].
  TextStyle get headlineSmall => appTextTheme.headlineSmall!.copyWith(
    fontSize: appTextTheme.headlineSmall!.fontSize! * _screenWidthScale,
  );

  /// 28 / 22 / SemiBold の [TextStyle].
  TextStyle get titleLarge => appTextTheme.titleLarge!.copyWith(
    fontSize: appTextTheme.titleLarge!.fontSize! * _screenWidthScale,
  );

  /// 24 / 16 / SemiBold の [TextStyle].
  TextStyle get titleMedium => appTextTheme.titleMedium!.copyWith(
    fontSize: appTextTheme.titleMedium!.fontSize! * _screenWidthScale,
  );

  /// 20 / 14 / SemiBold の [TextStyle].
  TextStyle get titleSmall => appTextTheme.titleSmall!.copyWith(
    fontSize: appTextTheme.titleSmall!.fontSize! * _screenWidthScale,
  );

  /// 20 / 14 / SemiBold の [TextStyle].
  TextStyle get labelLarge => appTextTheme.labelLarge!.copyWith(
    fontSize: appTextTheme.labelLarge!.fontSize! * _screenWidthScale,
  );

  /// 16 / 12 / SemiBold の [TextStyle].
  TextStyle get labelMedium => appTextTheme.labelMedium!.copyWith(
    fontSize: appTextTheme.labelMedium!.fontSize! * _screenWidthScale,
  );

  /// 16 / 11 / SemiBold の [TextStyle].
  TextStyle get labelSmall => appTextTheme.labelSmall!.copyWith(
    fontSize: appTextTheme.labelSmall!.fontSize! * _screenWidthScale,
  );

  /// 24 / 16 / Light の [TextStyle].
  TextStyle get bodyLarge => appTextTheme.bodyLarge!.copyWith(
    fontSize: appTextTheme.bodyLarge!.fontSize! * _screenWidthScale,
  );

  /// 20 / 14 / Light の [TextStyle].
  TextStyle get bodyMedium => appTextTheme.bodyMedium!.copyWith(
    fontSize: appTextTheme.bodyMedium!.fontSize! * _screenWidthScale,
  );

  /// 16 / 12 / Light の [TextStyle].
  TextStyle get bodySmall => appTextTheme.bodySmall!.copyWith(
    fontSize: appTextTheme.bodySmall!.fontSize! * _screenWidthScale,
  );

  /// displayLarge の 1 行の高さ。
  double get displayLargeLineHeight => 64;

  /// displayMedium の 1 行の高さ。
  double get displayMediumLineHeight => 52;

  /// displaySmall の 1 行の高さ。
  double get displaySmallLineHeight => 44;

  /// headlineLarge の 1 行の高さ。
  double get headlineLargeLineHeight => 40;

  /// headlineMedium の 1 行の高さ。
  double get headlineMediumLineHeight => 36;

  /// headlineSmall の 1 行の高さ。
  double get headlineSmallLineHeight => 32;

  /// titleLarge の 1 行の高さ。
  double get titleLargeLineHeight => 28;

  /// titleMedium の 1 行の高さ。
  double get titleMediumLineHeight => 24;

  /// titleSmall の 1 行の高さ。
  double get titleSmallLineHeight => 20;

  /// labelLarge の 1 行の高さ。
  double get labelLargeLineHeight => 20;

  /// labelMedium の 1 行の高さ。
  double get labelMediumLineHeight => 16;

  /// labelSmall の 1 行の高さ。
  double get labelSmallLineHeight => 16;

  /// bodyLarge の 1 行の高さ。
  double get bodyLargeLineHeight => 24;

  /// bodyMedium の 1 行の高さ。
  double get bodyMediumLineHeight => 20;

  /// bodySmall の 1 行の高さ。
  double get bodySmallLineHeight => 16;

  /// 画面横幅のスケール係数。
  ///
  /// [maxScreenWidth] を 1.0 として、現在の画面横幅との比率を計算する。
  double get _screenWidthScale => math.min(MediaQuery.sizeOf(this).width / maxScreenWidth, 1);
}
