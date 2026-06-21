import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:meshtastic/enum/note.dart';
import 'package:meshtastic/enum/project_duration.dart';
import 'package:meshtastic/model/project/data.dart';
import 'package:meshtastic/model/sheet/item.dart';
import 'package:uuid/uuid.dart';

class ToneProject extends ChangeNotifier {
  /// 乐谱存储 UUID
  String get uuid => _uuid;
  String _uuid = "";

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
  List<SheetItem> get sheet => _sheet;
  List<SheetItem> _sheet = List.empty(growable: true);

  /// 项目乐谱的音符个数
  int get notesCount => _sheet.length;

  /// 存储乐谱
  Future<String> saveProject() async {
    final ProjectData data = ProjectData(
      name: _name,
      length: _length,
      bpm: _bpm,
      key: _key,
      sheet: sheet
          .map((item) => SheetItemData(note: item.note, octave: item.octave, dotted: item.dotted))
          .toList(),
    );
    
    final uuidg = Uuid();
    _uuid = uuidg.v1();
    final box = await Hive.openBox<ProjectData>("tonebox_project");
    await box.put(uuid, data);
    await box.close();

    return uuid;
  }

  /// 读取乐谱
  Future<void> loadProject(String uuid) async {
    final box = await Hive.openBox<ProjectData>("tonebox_project");
    final data = box.get(uuid);
    if (data != null) {
      _name = data.name;
      _length = data.length;
      _bpm = data.bpm;
      _key = data.key;
      _sheet = data.sheet
          .map(
            (item) => SheetItem(
              note: item.note,
              octave: item.octave,
              duration: .quarter,
              dotted: item.dotted,
            ),
          )
          .toList();
    }
  }

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
  void updateSheetNote(int line, Note? value) {
    _sheet[line] = _sheet[line].copyWith(note: value);
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的八度
  void updateSheetOctave(int line, int value) {
    _sheet[line] = _sheet[line].copyWith(octave: value);
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的节拍
  void updateSheetDuration(int line, ProjectDuration value) {
    _sheet[line] = _sheet[line].copyWith(duration: value);
    notifyListeners();
  }

  /// 更新项目乐谱中某一行的附点
  void updateSheetDotted(int line, bool value) {
    _sheet[line] = _sheet[line].copyWith(dotted: value);
    notifyListeners();
  }
}
