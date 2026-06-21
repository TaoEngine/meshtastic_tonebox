import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('zh')];

  /// No description provided for @conform.
  ///
  /// In zh, this message translates to:
  /// **'确定'**
  String get conform;

  /// No description provided for @octave_c.
  ///
  /// In zh, this message translates to:
  /// **'C大调'**
  String get octave_c;

  /// No description provided for @octave_csharp.
  ///
  /// In zh, this message translates to:
  /// **'升C调'**
  String get octave_csharp;

  /// No description provided for @octave_d.
  ///
  /// In zh, this message translates to:
  /// **'D大调'**
  String get octave_d;

  /// No description provided for @octave_dsharp.
  ///
  /// In zh, this message translates to:
  /// **'升D调'**
  String get octave_dsharp;

  /// No description provided for @octave_e.
  ///
  /// In zh, this message translates to:
  /// **'E大调'**
  String get octave_e;

  /// No description provided for @octave_f.
  ///
  /// In zh, this message translates to:
  /// **'F大调'**
  String get octave_f;

  /// No description provided for @octave_fsharp.
  ///
  /// In zh, this message translates to:
  /// **'升F调'**
  String get octave_fsharp;

  /// No description provided for @octave_g.
  ///
  /// In zh, this message translates to:
  /// **'G大调'**
  String get octave_g;

  /// No description provided for @octave_gsharp.
  ///
  /// In zh, this message translates to:
  /// **'升G调'**
  String get octave_gsharp;

  /// No description provided for @octave_a.
  ///
  /// In zh, this message translates to:
  /// **'A大调'**
  String get octave_a;

  /// No description provided for @octave_asharp.
  ///
  /// In zh, this message translates to:
  /// **'升A调'**
  String get octave_asharp;

  /// No description provided for @octave_b.
  ///
  /// In zh, this message translates to:
  /// **'B大调'**
  String get octave_b;

  /// No description provided for @option_title.
  ///
  /// In zh, this message translates to:
  /// **'{name} 选项'**
  String option_title(String name);

  /// No description provided for @option_general_title.
  ///
  /// In zh, this message translates to:
  /// **'一般选项'**
  String get option_general_title;

  /// No description provided for @option_name_title.
  ///
  /// In zh, this message translates to:
  /// **'乐谱标题'**
  String get option_name_title;

  /// No description provided for @option_name_subtitle.
  ///
  /// In zh, this message translates to:
  /// **'修改标题 “{name}”'**
  String option_name_subtitle(String name);

  /// No description provided for @option_count_title.
  ///
  /// In zh, this message translates to:
  /// **'乐谱长度'**
  String get option_count_title;

  /// No description provided for @option_count_subtitle.
  ///
  /// In zh, this message translates to:
  /// **'可编辑 {count} 行'**
  String option_count_subtitle(int count);

  /// No description provided for @option_theory_title.
  ///
  /// In zh, this message translates to:
  /// **'乐理选项'**
  String get option_theory_title;

  /// No description provided for @option_bpm_title.
  ///
  /// In zh, this message translates to:
  /// **'乐谱 BPM'**
  String get option_bpm_title;

  /// No description provided for @option_bpm_subtitle.
  ///
  /// In zh, this message translates to:
  /// **'当前为 {bpm}'**
  String option_bpm_subtitle(int bpm);

  /// No description provided for @option_key_title.
  ///
  /// In zh, this message translates to:
  /// **'乐谱调性'**
  String get option_key_title;

  /// No description provided for @option_key_subtitle.
  ///
  /// In zh, this message translates to:
  /// **'当前为 {key}'**
  String option_key_subtitle(String key);

  /// No description provided for @option_hint.
  ///
  /// In zh, this message translates to:
  /// **'短按将直接打开设置弹窗，长按可查看选项的相关介绍和注意事项。其中乐谱BPM与拍号将直接影响直出的音乐效果'**
  String get option_hint;

  /// No description provided for @option_dialog_rename_title.
  ///
  /// In zh, this message translates to:
  /// **'修改乐谱标题'**
  String get option_dialog_rename_title;

  /// No description provided for @option_dialog_rename_label.
  ///
  /// In zh, this message translates to:
  /// **'乐谱标题'**
  String get option_dialog_rename_label;

  /// No description provided for @option_dialog_rename_validator.
  ///
  /// In zh, this message translates to:
  /// **'乐谱标题不能为空哦'**
  String get option_dialog_rename_validator;

  /// No description provided for @option_dialog_relength_title.
  ///
  /// In zh, this message translates to:
  /// **'修改乐谱长度'**
  String get option_dialog_relength_title;

  /// No description provided for @option_dialog_relength_subtitle.
  ///
  /// In zh, this message translates to:
  /// **'Meshtastic 设备可支持最长40行的乐谱。少于20行的，设备会播放两次'**
  String get option_dialog_relength_subtitle;

  /// No description provided for @option_dialog_relength_label.
  ///
  /// In zh, this message translates to:
  /// **'乐谱长度'**
  String get option_dialog_relength_label;

  /// No description provided for @option_dialog_relength_validator_empty.
  ///
  /// In zh, this message translates to:
  /// **'乐谱长度不能为空哦'**
  String get option_dialog_relength_validator_empty;

  /// No description provided for @option_dialog_relength_validator_long.
  ///
  /// In zh, this message translates to:
  /// **'对于设备来说这乐谱可太长了'**
  String get option_dialog_relength_validator_long;

  /// No description provided for @option_dialog_setbpm_title.
  ///
  /// In zh, this message translates to:
  /// **'修改乐谱 BPM'**
  String get option_dialog_setbpm_title;

  /// No description provided for @option_dialog_setbpm_subtitle.
  ///
  /// In zh, this message translates to:
  /// **'将调整 BPM 值为 {bpm}'**
  String option_dialog_setbpm_subtitle(int bpm);

  /// No description provided for @option_dialog_setkey_title.
  ///
  /// In zh, this message translates to:
  /// **'修改乐谱调性'**
  String get option_dialog_setkey_title;

  /// No description provided for @option_dialog_setkey_subtitle.
  ///
  /// In zh, this message translates to:
  /// **'此处的操作相当于将乐谱的C大调映射为{key}'**
  String option_dialog_setkey_subtitle(String key);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
