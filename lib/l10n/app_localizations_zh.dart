// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get octave_c => 'C大调';

  @override
  String get octave_csharp => '升C调';

  @override
  String get octave_d => 'D大调';

  @override
  String get octave_dsharp => '升D调';

  @override
  String get octave_e => 'E大调';

  @override
  String get octave_f => 'F大调';

  @override
  String get octave_fsharp => '升F调';

  @override
  String get octave_g => 'G大调';

  @override
  String get octave_gsharp => '升G调';

  @override
  String get octave_a => 'A大调';

  @override
  String get octave_asharp => '升A调';

  @override
  String get octave_b => 'B大调';

  @override
  String option_title(String name) {
    return '$name 选项';
  }

  @override
  String get option_general_title => '一般选项';

  @override
  String get option_name_title => '乐谱标题';

  @override
  String option_name_subtitle(String name) {
    return '修改标题 “$name”';
  }

  @override
  String get option_count_title => '乐谱长度';

  @override
  String option_count_subtitle(int count) {
    return '可编辑 $count 行';
  }

  @override
  String get option_theory_title => '乐理选项';

  @override
  String get option_bpm_title => '乐谱 BPM';

  @override
  String option_bpm_subtitle(int bpm) {
    return '当前为 $bpm';
  }

  @override
  String get option_key_title => '乐谱调性';

  @override
  String option_key_subtitle(String key) {
    return '当前为 $key';
  }

  @override
  String get option_hint => '短按将直接打开设置弹窗，长按可查看选项的相关介绍和注意事项。其中乐谱BPM与拍号将直接影响直出的音乐效果';
}
