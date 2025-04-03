import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/page/quiz/quiz_page.dart';
import 'style/typography.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Preflop',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFFE5B94E), // ゴールド
            secondary: Color(0xFF1F8A70), // ディープネイビー
            surface: Color(0xFF2C2C44), // ダークブルーグレー
            error: Color(0xFFCF2A2A), // ディープレッド
          ),
          scaffoldBackgroundColor: const Color(0xFF1A1A2E),
          cardColor: const Color(0xFF2C2C44),
          useMaterial3: true,
          textTheme: appTextTheme,
        ),
        home: const QuizPage(),
        builder: (context, child) {
          return Center(
            child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 480), child: child),
          );
        },
      ),
    ),
  );
}
