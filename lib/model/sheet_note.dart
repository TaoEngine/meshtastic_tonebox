import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meshtastic/enum/project_duration.dart';
import 'package:meshtastic/enum/tone_type.dart';

part 'sheet_note.freezed.dart';

/// 乐谱的某一行，包含音名，八度和节拍
@freezed
class SheetNote with _$SheetNote {
  /// 音名
  @override
  final ToneType name;

  /// 八度
  @override
  final int octave;

  /// 节拍
  @override
  final ProjectDuration duration;

  /// 附点
  @override
  final bool dotted;

  const SheetNote({
    required this.name,
    required this.octave,
    required this.duration,
    required this.dotted,
  });
}
