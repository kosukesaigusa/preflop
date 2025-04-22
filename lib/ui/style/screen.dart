import 'dart:math';

import 'package:flutter/material.dart';

/// 最大画面横幅。
const maxScreenWidth = 480.0;

/// 画面全体に対する水平方向の余白。
const screenHorizontalPadding = 16.0;

/// [BuildContext] 型の拡張クラス。
extension BuildContextExtension on BuildContext {
  /// 画面横幅。
  double get screenWidth => min(maxScreenWidth, MediaQuery.of(this).size.width);
}
