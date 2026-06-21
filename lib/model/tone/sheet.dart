import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meshtastic/enum/note.dart';
import 'package:meshtastic/enum/project_duration.dart';

part 'sheet.freezed.dart';

/// 乐谱的某一行，包含八度和节拍
@freezed
class ToneSheet with _$ToneSheet {
  /// 音名
  @override
  final Note? note;

  /// 八度
  @override
  final int octave;

  /// 节拍
  @override
  final ProjectDuration duration;

  /// 附点
  @override
  final bool dotted;

  const ToneSheet({
    required this.note,
    required this.octave,
    required this.duration,
    required this.dotted,
  });
}
