import 'package:flutter/foundation.dart';
import 'package:meshtastic/enum/project_beats.dart';
import 'package:meshtastic/enum/project_duration.dart';
import 'package:meshtastic/enum/tone_type.dart';
import 'package:meshtastic/model/sheet_note.dart';

class ToneProject extends ChangeNotifier {
  String _name = "未命名乐谱";

  /// 乐谱名称
  String get name => _name;

  int _bpm = 120;

  /// 乐谱 BPM
  int get bpm => _bpm;

  ProjectBeats _beats = .fourFour;

  /// 乐谱拍号
  ProjectBeats get beats => _beats;

  ProjectDuration _durationDefault = .quarter;

  /// 项目默认音符时长
  ProjectDuration get durationDefault => _durationDefault;

  final List<SheetNote> _notes = List.filled(
    40,
    SheetNote(name: .P, octave: 4, duration: .quarter, dotted: false),
    growable: false,
  );

  /// 项目的乐谱
  List<SheetNote> get notes => _notes;

  /// 项目乐谱的音符个数
  int get notesCount => _notes.length;

  /// 更新项目名称
  void updateName(String value) {
    _name = value;
    notifyListeners();
  }

  /// 更新项目 BPM
  void updateBpm(int value) {
    _bpm = value;
    notifyListeners();
  }

  /// 更新项目拍号
  void updateBeats(ProjectBeats value) {
    _beats = value;
    notifyListeners();
  }

  /// 更新项目默认音符时长
  void updateDurationDefault(ProjectDuration value) {
    _durationDefault = value;
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的音名
  void updateNoteName(int line, ToneType value) {
    _notes[line] = _notes[line].copyWith(name: value);
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的八度
  void updateNoteOctave(int line, int value) {
    _notes[line] = _notes[line].copyWith(octave: value);
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的节拍
  void updateNoteDuration(int line, ProjectDuration value) {
    _notes[line] = _notes[line].copyWith(duration: value);
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的附点
  void updateNoteDotted(int line, bool value) {
    _notes[line] = _notes[line].copyWith(dotted: value);
    notifyListeners();
  }
}
