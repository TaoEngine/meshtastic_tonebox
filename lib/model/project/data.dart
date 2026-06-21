import 'package:hive_ce/hive_ce.dart';
import 'package:meshtastic/enum/note.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
class ProjectData {
  /// 乐谱名称
  @HiveField(0)
  String name;

  /// 乐谱总长度
  @HiveField(1)
  int length;

  /// 乐谱 BPM
  @HiveField(2)
  int bpm;

  /// 乐谱调号
  // Note get key => Note.values.firstWhere((note) => note.symbol == _key);
  // set key(Note value) => _key = value.name;
  @HiveField(3)
  Note key;

  /// 项目的乐谱
  @HiveField(4)
  List<SheetItemData> sheet;

  ProjectData({
    required this.name,
    required this.length,
    required this.bpm,
    required this.key,
    required this.sheet,
  });
}

@HiveType(typeId: 1)
class SheetItemData {
  /// 音名
  // Note? get note => Note.values.firstWhere((note) => note.symbol == _note);
  // set note(Note? value) => _note = value?.name;
  @HiveField(0)
  Note? note;

  /// 八度
  @HiveField(1)
  int octave;

  /// 节拍
  // final ProjectDuration duration;

  /// 附点
  @HiveField(2)
  bool dotted;

  SheetItemData({required this.note, required this.octave, required this.dotted});
}
