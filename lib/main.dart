import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/logic/preflop_hand_range_matrix.dart';
import 'model/service/shared_preferences_service.dart';
import 'model/util/app_last_updated_at.dart';
import 'model/util/logger.dart';
import 'model/util/package_info.dart';
import 'ui/page/quiz/quiz_page.dart';
import 'ui/style/color.dart';
import 'ui/style/screen.dart';
import 'ui/style/typography.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 画面の向きを縦向きに固定する。
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // アプリのパッケージ情報を取得する。
  final packageInfo = await getPackageInfo();
  logger.d('appVersion: ${packageInfo.version}');

  // 最終更新日時（デプロイ日時）の情報を Dart-Define から取得する。
  const lastUpdated = String.fromEnvironment('LAST_UPDATED');
  final lastUpdatedDateTime = DateTime.tryParse(lastUpdated);
  if (lastUpdatedDateTime != null) {
    logger.d('lastUpdated: $lastUpdatedDateTime');
  }

  // SharedPreferences の初期化を行う。
  final sharedPreferencesService = getSharedPreferencesService();

  // ProviderContainer を作成する。
  final container = ProviderContainer(
    observers: [_ProviderErrorLoggerObserver()],
    // NOTE: アプリのエントリポイントで上書きするべき Provider を列挙する。
    // 管理の目的でアルファベット順で列挙することにしている。
    overrides: [
      // アプリの更新日時を上書きする。
      appLastUpdatedAtProvider.overrideWith((_) => lastUpdatedDateTime),
      // アプリのパッケージ情報を上書きする。
      packageInfoProvider.overrideWith((_) => packageInfo),
      // SharedPreferencesService を上書きする。
      sharedPreferencesServiceProvider.overrideWith((_) => sharedPreferencesService),
    ],
  );

  // 前回、最後に選択されたプリフロップハンドレンジ表を取得を予め行っておく。
  final initialPreflopHandRangeMatrix = await container.read(
    initialPreflopHandRangeMatrixProvider.future,
  );
  logger.d('initialPreflopHandRangeMatrix ID: ${initialPreflopHandRangeMatrix?.id}');

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: DevicePreview(
        // ignore: avoid_redundant_argument_values
        enabled: kDebugMode,
        builder:
            (_) => MaterialApp(
              // NOTE: Flutter SDK では deprecated になっているが、DevicePreview の
              // 利用のために必要である。
              // ignore: deprecated_member_use
              useInheritedMediaQuery: true,
              scrollBehavior: _CustomScrollBehavior(),
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
                appBarTheme: AppBarTheme(
                  backgroundColor: AppColor.darkNavy,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  surfaceTintColor: Colors.transparent,
                  titleTextStyle: appTextTheme.titleMedium,
                ),
                useMaterial3: true,
                textTheme: appTextTheme,
              ),
              home: const QuizPage(),
              builder:
                  (context, child) => Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: maxScreenWidth),
                      child: child,
                    ),
                  ),
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

/// Web でドラッグスクロールを有効にするためのカスタム [ScrollBehavior].
class _CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}
