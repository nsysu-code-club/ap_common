# CLAUDE.md

## 專案概述

**ap_common** 是一個 Flutter/Dart monorepo，提供 AP（校務通）系列教育類 App（NKUST、NSYSU、WTUC 等）的共用套件。使用 **Melos** 與 **pub workspaces** 管理。

## Tech Stack

- **Dart SDK**: ^3.9.0、**Flutter**: >=3.24.0 <4.0.0
- **套件管理**: Melos ^7.5.0 搭配 pub workspaces
- **Flutter 版本管理**: FVM（本地版本 3.44.8，SDK 路徑：`.fvm/flutter_sdk`）
- **CI Flutter 版本**: 3.44.8（stable channel）
- **HTTP**: Dio
- **序列化**: freezed + json_serializable
- **多語系**: slang + slang_flutter（已從 intl 遷移）
- **Lint**: `package:lint/strict.yaml`

## Monorepo 結構

```
packages/
  ap_common_core/              # 純 Dart：資料模型、工具、ApiResult、DataState
  ap_common_flutter_core/      # Flutter：多語系、主題、工具
  ap_common_flutter_platform/  # 平台實作：加密、時區、通知、SharedPreferences
  ap_common_flutter_ui/        # UI 元件、Scaffold、便利頁面（Material 3）
  ap_common_announcement_ui/   # 公告服務：API + UI 頁面
  ap_common/                   # 整合套件，re-export 上述套件
  ap_common_firebase/          # Firebase：Firestore、FCM、Analytics
  ap_common_plugin/            # 原生課表小工具（Android Widget）
apps/
  example/                     # 範例 App（含 simple example 展示簡化寫法）
```

**套件依賴鏈：**
```
ap_common_core
  └─ ap_common_flutter_core
       ├─ ap_common_flutter_platform
       ├─ ap_common_flutter_ui
       │    └─ ap_common_announcement_ui
       └─ (ap_common = 整合套件，re-export flutter_ui + flutter_platform + announcement_ui)
```

## 常用指令

```bash
# 所有指令透過 melos 執行；Flutter SDK 路徑由 FVM 管理
melos run analyze          # dart analyze 所有套件
melos run analyze-ci       # 嚴格分析（--fatal-infos），CI 使用
melos run format           # dart format 所有套件
melos run format-check     # 格式檢查（CI）
melos run test             # flutter test（有 test/ 目錄的套件）
melos run fix              # dart fix --apply
melos run pub-check        # 模擬發布檢查
melos run release          # 正式版發布
melos run release:dev      # 預發布版本
```

## 程式碼風格與慣例

- **Lint 規則**: `package:lint/strict.yaml`，自訂規則在根目錄 `analysis_options.yaml`
- **必須明確指定型別**（`always_specify_types: true`）
- **使用單引號**（`prefer_single_quotes: true`）
- **每行 80 字元限制**（`lines_longer_than_80_chars: true`）
- **建構子排在類別最前面**（`sort_constructors_first: true`）
- **Commit 訊息**: 使用英文 Conventional Commits（如 `feat(scope):`、`fix(scope):`、`refactor(scope):`）
- **產生的檔案**: `*.g.dart`、`l10n/*.g.dart` 排除在分析之外；修改 freezed/json_serializable 模型後需執行 `build_runner`

## API 模式（目前標準）

### ApiResult\<T\>

專案使用 `ApiResult<T>` sealed class 實現型別安全的 API 回應：

```dart
sealed class ApiResult<T> {}
class ApiSuccess<T> extends ApiResult<T> { final T data; }
class ApiError<T> extends ApiResult<T> { final GeneralResponse response; }
class ApiFailure<T> extends ApiResult<T> { final DioException exception; }
```

UI 程式碼使用 `switch` 對 `ApiResult` 進行模式匹配：
```dart
final ApiResult<Data> result = await helper.fetchData();
switch (result) {
  case ApiSuccess(:final data): // 處理成功
  case ApiError(:final response): // 處理預期的 API 錯誤
  case ApiFailure(:final exception): // 處理網路失敗
}
```

錯誤顯示使用 `ApiResult` 的 `showErrorToast` 擴充方法。

### DataState\<T\>

`DataState<T>`（位於 `ap_common_core`）是 UI 狀態管理用的 sealed class，用於表示非同步資料載入狀態：

```dart
sealed class DataState<T> {}
class DataLoading<T> extends DataState<T> {}
class DataLoaded<T> extends DataState<T> { final T data; final String? hint; }
class DataError<T> extends DataState<T> { final String? hint; }
class DataEmpty<T> extends DataState<T> { final String? hint; }
```

支援 `when()` callback、`map()` 轉型、`dataOrNull` getter、Dart 3 exhaustive switch。

## 便利 Widget（簡化整合 API）

位於 `ap_common_flutter_ui/lib/src/pages/`，大幅減少 App 整合時的樣板程式碼：

| Widget | 取代 | 簡化內容 |
|--------|------|----------|
| `ApApp` | `MaterialApp` + `ApTheme` + `TranslationProvider` | 主題、i18n、edge-to-edge 一次搞定 |
| `ApLoginPage` | `LoginScaffold` + 偏好設定管理 | 內建記住密碼、自動登入、離線登入 |
| `ApCoursePage` | `CourseScaffold` + 學期載入 + 狀態管理 | 只需提供 `onLoadSemesters` 和 `onLoadCourse` |
| `ApScorePage` | `ScoreScaffold` + 學期載入 + 狀態管理 | 只需提供 `onLoadSemesters` 和 `onLoadScore` |

### Scaffold fromDataState() Constructors

以下 Scaffold 支援直接傳入 `DataState<T>` 自動對應狀態：

- `CourseScaffold.fromDataState()` — 接收 `DataState<CourseData>`
- `ScoreScaffold.fromDataState()` — 接收 `DataState<ScoreData?>`
- `HomePageScaffold.fromDataState()` — 接收 `DataState<List<Announcement>>`

## CI/CD

- GitHub Actions 工作流程位於 `.github/workflows/`
- **CI 流程**（`ci.workflow.yml`）：
  1. `melos run test --no-select` — 執行所有套件測試
  2. `melos run analyze-ci` — 嚴格分析（`--fatal-infos`）
  3. `flutter build web` — 建置 example web app
- **CI 環境**: Flutter 3.44.8；workspace 使用 Melos 7.5.0，兩個 CI test jobs 透過 `bluefireteam/melos-action@v3` 安裝 Melos 6.1.0
- **部署環境**: `deploy.workflow.yml` 與 `deploy.dev.workflow.yml` 使用 `bluefireteam/melos-action@v3`，未指定 `melos-version`，因此使用 action 預設的最新版
- PR 自動化：`pr_agent.yml`

## 重要備註

- `ap_common_core` 是**純 Dart** 套件（無 Flutter 依賴）
- `GeneralCallback<T>` 已從 codebase 移除，新程式碼使用 `ApiResult<T>` 或 `DataState<T>`
- 圖片上傳工具（Imgur、Imgbb、GitHub）位於 `ap_common_announcement_ui/src/api/`
- Swagger/OpenAPI 規格書：`packages/ap_common/swaggers/announcement_api.json`
- `ap_common_plugin` 目前僅 Android 課表小工具有完整實作，iOS 端為 stub
