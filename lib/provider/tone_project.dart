import 'package:flutter/foundation.dart';
import 'package:meshtastic/enum/note.dart';
import 'package:meshtastic/enum/project_duration.dart';
import 'package:meshtastic/model/tone/sheet.dart';

class ToneProject extends ChangeNotifier {
  /// 乐谱名称
  String get name => _name;
  String _name = "未命名乐谱";

  /// 乐谱总长度
  int get length => _length;
  int _length = 40;

  /// 乐谱 BPM
  int get bpm => _bpm;
  int _bpm = 120;

  /// 乐谱调号
  Note get key => _key;
  Note _key = .c;

  /// 项目默认音符时长
  ProjectDuration get durationDefault => _durationDefault;
  ProjectDuration _durationDefault = .quarter;

  /// 项目的乐谱
  List<ToneSheet> get sheet => _sheet;
  final List<ToneSheet> _sheet = List.filled(
    40,
    ToneSheet(note: null, octave: 4, duration: .quarter, dotted: false),
    growable: false,
  );

  /// 项目乐谱的音符个数
  int get notesCount => _sheet.length;

  /// 更新乐谱名称
  void updateName(String value) {
    _name = value;
    notifyListeners();
  }

  /// 更新乐谱总长度
  void updateLength(int value) {
    _length = value;
    notifyListeners();
  }

  /// 更新项目 BPM
  void updateBpm(int value) {
    _bpm = value;
    notifyListeners();
  }

  /// 更新乐谱调号
  void updateKey(Note value) {
    _key = value;
    notifyListeners();
  }

  /// 更新项目默认音符时长
  void updateDurationDefault(ProjectDuration value) {
    _durationDefault = value;
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的音名
  void updateNoteName(int line, Note? value) {
    _sheet[line] = _sheet[line].copyWith(note: value);
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的八度
  void updateNoteOctave(int line, int value) {
    _sheet[line] = _sheet[line].copyWith(octave: value);
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的节拍
  void updateNoteDuration(int line, ProjectDuration value) {
    _sheet[line] = _sheet[line].copyWith(duration: value);
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的附点
  void updateNoteDotted(int line, bool value) {
    _sheet[line] = _sheet[line].copyWith(dotted: value);
    notifyListeners();
  }
}
