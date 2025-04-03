import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/page/quiz/quiz_page.dart';
import 'style/color.dart';
import 'style/typography.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Preflop',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(
            primary: AppColor.gold,
            secondary: AppColor.darkNavy,
            surface: AppColor.darkBlueGrey,
            error: AppColor.red,
          ),
          scaffoldBackgroundColor: AppColor.darkNavy,
          cardColor: AppColor.darkBlueGrey,
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
