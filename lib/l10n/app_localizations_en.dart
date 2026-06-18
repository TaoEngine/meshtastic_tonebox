// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String toneOptionPage_Title(String name) {
    return '$name 选项';
  }

  @override
  String get toneOptionPage_GeneralOptions => 'General options';

  @override
  String get toneOptionPage_TheoryOptions => 'Theory options';
}
