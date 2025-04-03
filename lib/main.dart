import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/util/logger.dart';
import 'model/util/package_info.dart';
import 'ui/page/quiz/quiz_page.dart';
import 'ui/style/color.dart';
import 'ui/style/typography.dart';

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
      observers: [_ProviderErrorLoggerObserver()],
      overrides: [packageInfoProvider.overrideWith((_) => packageInfo)],
      child: DevicePreview(
        builder:
            (_) => MaterialApp(
              // NOTE: Flutter SDK では deprecated になっているが、DevicePreview の
              // 利用のために必要である。
              // ignore: deprecated_member_use
              useInheritedMediaQuery: true,
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
                appBarTheme: const AppBarTheme(
                  backgroundColor: AppColor.darkNavy,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  surfaceTintColor: Colors.transparent,
                ),
                useMaterial3: true,
                textTheme: appTextTheme,
              ),
              home: const QuizPage(),
              builder: (context, child) {
                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: child,
                  ),
                );
              },
            ),
      ),
    ),
  );
}

/// Riverpod の Provider がエラーを送出した場合にロギングするオブザーバ。
///
/// ルートの [ProviderScope] に指定する [ProviderObserver] を定義する。
///
/// 参考：https://riverpod.dev/docs/essentials/provider_observer
class _ProviderErrorLoggerObserver extends ProviderObserver {
  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e('Provider $provider threw $error at $stackTrace');
  }
}
