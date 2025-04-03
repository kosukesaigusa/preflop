import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/page/quiz/quiz_page.dart';
import 'app/util/typography.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Preflop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
