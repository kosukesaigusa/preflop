# Preflop Trainer プロジェクト概要

## 1. 概要

* **プロジェクト名:** `preflop_trainer`
* **目的:** ポーカーのプリフロップハンドレンジを学習するための Flutter アプリケーション。

## 2. 主要機能

* **クイズ機能:**
  * ランダムに提示されるハンドに対し、選択されたハンドレンジに基づいた正しいランクを回答する。
  * 正誤判定を表示する。
  * 回答履歴を閲覧できる（復習機能）。
  * クイズ中に対応するハンドレンジを確認できる。
* **マトリックス表示機能:**
  * 選択されたハンドレンジを 13x13 のマトリックス形式で視覚的に表示する。
  * ランクごとに色分けされ、凡例も表示される。
* **ハンドレンジ選択機能:**
  * 複数のハンドレンジ（例: トーナメント用、リングゲーム用）をドロップダウンで切り替え可能。

## 3. アーキテクチャ

* **UI 層:** Flutter フレームワーク (Material Design) を使用。主要画面は `QuizPage`, `MatrixPage`, `ReviewPage`。レスポンシブ対応。
* **状態管理:** Riverpod を採用。機能ごとに Provider (`NotifierProvider`, `Provider`) を分割し、状態を集中的に管理。コード生成 (`riverpod_generator`) を利用。
* **データモデリング:** Freezed を使用してイミュータブルなデータクラス (Entity) を定義。Enum を活用してカードの種類やハンドなどを表現。
* **データソース:** プリフロップハンドレンジのデータは `lib/model/data/hand_range/` 以下に Dart の Map リテラルとして静的に定義。
* **関心の分離:** `lib/model` (データ、ロジック) と `lib/ui` (表示) でディレクトリを分離。

## 4. 使用技術スタック

* **フレームワーク:** Flutter (FVM によるバージョン管理)
* **状態管理:** Riverpod (`hooks_riverpod`, `riverpod_annotation`, `riverpod_generator`)
* **イミュータブルデータクラス:** Freezed (`freezed_annotation`)
* **JSON/Map 変換:** `json_annotation`, `json_serializable` (Freezed と連携)
* **アセット管理:** flutter\_gen (`flutter_gen_runner`)
* **Lint/静的解析:** Dart/Flutter 標準ルール + カスタマイズ (`analysis_options.yaml`), `custom_lint`, `riverpod_lint`
* **ロギング:** `logger`
* **その他:** `device_preview`, `package_info_plus`, `gap` など

## 5. ディレクトリ構造

```txt
preflop_trainer/
├── .clinerules/         # プロジェクトルール/ドキュメント
├── .fvmrc               # FVM 設定
├── analysis_options.yaml # Lint/解析設定
├── pubspec.yaml         # プロジェクト定義、依存関係
├── README.md            # プロジェクト概要、セットアップ手順
├── assets/              # 画像、フォントなど
│   ├── fonts/
│   └── svg/
├── lib/                 # Dart ソースコード
│   ├── main.dart        # アプリエントリーポイント
│   ├── model/           # データモデル、ロジック、データソース
│   │   ├── data/
│   │   ├── entity/
│   │   ├── logic/
│   │   └── util/
│   └── ui/              # UI関連 (画面、ウィジェット、スタイル)
│       ├── page/
│       ├── style/
│       ├── util/
│       └── widget/
└── web/                 # Web アプリ用ファイル
```

## 6. コーディング規約・ルール

* `analysis_options.yaml` に基づく Lint ルールを適用。
* 型安全性を重視。
* 1行あたり 100 文字。
* Riverpod, Freezed などのコード生成を活用。

## 7. コメント規約

詳細は [`./COMMENT_GUIDE.md`](./COMMENT_GUIDE.md) を参照してください。
