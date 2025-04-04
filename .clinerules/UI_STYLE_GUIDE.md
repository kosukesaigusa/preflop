# UI スタイルガイド

このドキュメントは、`lib/ui/style/` ディレクトリ内のファイルの使用方法について説明します。

## 1. 色 (`lib/ui/style/color.dart`)

* **目的:** アプリケーション全体で使用する色を定義します。
* **定義:** `AppColor` という `abstract interface class` 内に、`static const Color` として定義されています。
* **使用方法:** `AppColor.色名` の形式でアクセスします。

```dart
// 例:
Container(color: AppColor.darkNavy);
Text('Warning', style: TextStyle(color: AppColor.red));
```

* **注意点:** UI 要素の色は原則として `AppColor` で定義された色を使用してください。直接 `Color(0xFF...)` のように色を指定することは避けてください。

## 2. タイポグラフィ (`lib/ui/style/typography.dart`)

* **目的:** アプリケーション全体で使用するテキストスタイルとフォントを定義します。
* **定義:**
  * `appTextTheme`: Material Design の `TextTheme` に基づき、アプリ固有の `TextStyle` を定義しています。フォントファミリー (`NotoSansJP`, `NotoColorEmoji`) や文字色 (`AppColor`) が設定されています。フォントファミリー名は `flutter_gen` によって生成された `FontFamily` クラス (`lib/ui/style/gen/fonts.gen.dart`) を参照しています。
  * `BuildContextExtension`: `BuildContext` の拡張メソッドとして、`appTextTheme` で定義された各テキストスタイル (例: `displayLarge`, `bodyMedium`) およびその行の高さ (例: `displayLargeLineHeight`, `bodyMediumLineHeight`) に簡単にアクセスするための getter を提供します。
* **使用方法:** `BuildContext` の拡張メソッド (`context.スタイル名`) を使用してテキストスタイルを適用します。

```dart
// 例:
Text('タイトル', style: context.titleLarge);
Text('本文テキスト', style: context.bodyMedium);
// 行の高さを取得する場合:
final double lineHeight = context.titleLargeLineHeight;
```

* **注意点:** テキストのスタイルは、原則として `context.スタイル名` で提供されるスタイルを使用してください。個別に `TextStyle` を定義することは避けてください。

## 3. アセット生成 (`lib/ui/style/gen/`)

* このディレクトリ内のファイル (`assets.gen.dart`, `fonts.gen.dart`) は `flutter_gen` によって自動生成されます。
* `assets/` ディレクトリ内の画像やフォントへのタイプセーフなアクセスを提供します。
* 手動で編集しないでください。アセットを追加・変更した場合は、`flutter pub run build_runner build` コマンドを実行して再生成してください。
