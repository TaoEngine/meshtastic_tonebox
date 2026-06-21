// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get conform => '确定';

  @override
  String get note_c => 'C大调';

  @override
  String get note_csharp => '升C调';

  @override
  String get note_d => 'D大调';

  @override
  String get note_dsharp => '升D调';

  @override
  String get note_e => 'E大调';

  @override
  String get note_f => 'F大调';

  @override
  String get note_fsharp => '升F调';

  @override
  String get note_g => 'G大调';

  @override
  String get note_gsharp => '升G调';

  @override
  String get note_a => 'A大调';

  @override
  String get note_asharp => '升A调';

  @override
  String get note_b => 'B大调';

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

  @override
  String get option_dialog_rename_title => '修改乐谱标题';

  @override
  String get option_dialog_rename_label => '乐谱标题';

  @override
  String get option_dialog_rename_validator => '乐谱标题不能为空哦';

  @override
  String get option_dialog_relength_title => '修改乐谱长度';

  @override
  String get option_dialog_relength_subtitle => 'Meshtastic 设备可支持最长40行的乐谱。少于20行的，设备会播放两次';

  @override
  String get option_dialog_relength_label => '乐谱长度';

  @override
  String get option_dialog_relength_validator_empty => '乐谱长度不能为空哦';

  @override
  String get option_dialog_relength_validator_long => '对于设备来说这乐谱可太长了';

  @override
  String get option_dialog_setbpm_title => '修改乐谱 BPM';

  @override
  String option_dialog_setbpm_subtitle(int bpm) {
    return '将调整 BPM 值为 $bpm';
  }

  @override
  String get option_dialog_setkey_title => '修改乐谱调性';

  @override
  String option_dialog_setkey_subtitle(String key) {
    return '此处的操作相当于将乐谱的C大调映射为$key';
  }
}
