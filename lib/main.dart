import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/page/quiz/quiz_page.dart';
import 'style/color.dart';
import 'style/typography.dart';
import 'util/logger.dart';
import 'util/package_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // アプリのパッケージ情報を取得する。
  final packageInfo = await getPackageInfo();
  logger.d('appVersion: ${packageInfo.version}');

  // 画面の向きを縦向きに固定する。
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ProviderScope(
      overrides: [packageInfoProvider.overrideWith((_) => packageInfo)],
      child: MaterialApp(
        title: 'Preflop Trainer',
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ja', 'JP')],
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
