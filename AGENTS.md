# AGENTS.md

## 项目

`meshtastic_tonebox` —— 一个 Flutter 应用，用于编排 RTTTL 旋律（固定 40 个音符的乐谱，包含 BPM、拍号、时长），并通过 **经典蓝牙 SPP**（而非 BLE）上传到 Meshtastic 设备。

目标平台为 Android + Windows（均已脚手架化，见 `android/` 与 `windows/`）。Dart SDK 约束：`^3.11.5`（代码中使用 Dart 3 的点简写，如 `.fourFour`、`crossAxisAlignment: .start`）。

## 命令

- `flutter pub get` —— 安装依赖；请提交 `pubspec.lock`。
- `flutter analyze` —— 按 `analysis_options.yaml`（`flutter_lints`）执行静态检查。
- `flutter test` —— 跑测试，但请先看下方 "Gotchas" 再相信结果。
- `dart run build_runner build --delete-conflicting-outputs` —— **必须**在修改 `@freezed` 类（目前只有 `lib/model/sheet_note.dart`）后执行。重新生成 `sheet_note.freezed.dart`。
- `flutter gen-l10n` —— **必须**在修改 `lib/l10n/intl_*.arb` 后执行。重新生成 `app_localizations*.dart`。由 `l10n.yaml` 驱动。
- `dart run flutter_launcher_icons` —— 按 `flutter_launcher_icons.yaml` 配置，从 `assets/icon/icon.png` 重新生成启动图标。
- `flutter run -d <android|windows>` —— 开发期运行。

## 架构

- **入口**：`lib/main.dart` → `runApp(ChangeNotifierProvider(create: ToneProject(), child: MyApp()))`。主题来自 `DynamicColorBuilder`，并强制将 `progressIndicatorTheme` / `sliderTheme` 的 `year2023: false`（刻意保留旧版组件变体）。
- **状态**：唯一 `ToneProject`（`lib/provider/tone_project.dart`）继承 `ChangeNotifier`。保存名称、BPM、拍号、默认时长，以及一个长度恒为 **40** 的 `List<SheetNote>`。
- **路由**：`go_router` 配置在 `lib/ui/page/router.dart`。路径：
  - `/` → `ToneEditPage`（主编辑器）
  - `/a` → `ToneFilePage`（占位）
  - `/option` → `ToneOptionPage`（重命名、BPM 对话框）
  - `/settings` → `SettingsPage`（占位）
- **模型**：`lib/model/sheet_note.dart` 是目前唯一的 `@freezed` 类；其 `.freezed.dart` 为生成产物。
- **国际化**：`intl_zh.arb` 是 **模板**（见 `l10n.yaml: template-arb-file`），`intl_en.arb` 为次级语言。
- **UI 组织**：`lib/ui/page/<area>/<name>.dart` 放页面，`lib/ui/widget/<area>/...` 放组件。通过 `Consumer<ToneProject>` 读取状态（见 `lib/ui/page/tone/option.dart`）。

## 约定

- 修改乐谱状态一律走 `ToneProject.updateNoteName/Octave/Duration/Dotted(...)`——内部为 `_notes[i].copyWith(...)` + `notifyListeners()`。不要在 widget 里直接重新赋值 `_notes`。
- 项目级状态（name、BPM、beats、durationDefault）必须走 `ToneProject` 上对应的 `update*` 方法。
- 新增路由：在 `lib/ui/page/router.dart` 中添加 `GoRoute`，再用 `context.push("/path")` 跳转（用法见 `lib/ui/page/tone/edit.dart`）。
- ARB key 按页面命名空间化，例如 `toneOptionPage_Title`、`toneOptionPage_GeneralOptions`。新增字符串请沿用此风格。

## 已知的占位/未实现部分（不要假设其已实现）

- `lib/ui/page/tone/file.dart` —— 空的 `Container()`。
- `lib/ui/page/app/settings.dart` —— 空的 `Container()`。
- `lib/ui/page/driver/upload.dart` —— **0 字节**。
- `lib/func/rtttl/` 与 `lib/func/tonebox/` —— 空目录，预留给 RTTTL 解析器与 Meshtastic 上传逻辑。
- 路由 `/a` 与 `/settings` 已存在但渲染为空。

## Gotchas

- **`test/widget_test.dart` 是默认的 Flutter 计数器测试** —— 它依赖 `Icons.add` 与计数器 UI，但本应用并不存在这些，跑测试会失败。在依赖 `flutter test` 之前请重写或直接删除。
- **数字 40 出现了两处**：`lib/provider/tone_project.dart`（`List.filled(40, ...)`）与 `lib/ui/widget/tone/editor.dart`（`List.generate(40, ...)`）。修改行数时必须同时改两处，否则行下标会错位。
- **蓝牙为经典 SPP**（`flutter_bluetooth_classic_serial`），不是 BLE——Android 清单的权限申请与配对流程都与典型 BLE 应用不同。
- `analysis_options.yaml` 仍保留着脚手架自带的注释块——保留即可；如需新增 lint，请在 `linter.rules` 下添加。
- `.vscode/settings.json` 只为 Windows runner 配置了 CMake 源目录；未提交任何 Dart 相关的 IDE 设置。