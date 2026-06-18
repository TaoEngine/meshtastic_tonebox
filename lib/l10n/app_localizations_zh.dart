// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String toneOptionPage_Title(String name) {
    return '$name 选项';
  }

  @override
  String get toneOptionPage_GeneralOptions => '一般选项';

  @override
  String get toneOptionPage_TheoryOptions => '乐理选项';
}
