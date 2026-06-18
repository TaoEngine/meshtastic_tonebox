/// 音符的时长
enum ProjectDuration {
  /// 全音音符
  whole(1),

  /// 半音音符
  half(2),

  /// 四分之一音符
  quarter(4),

  /// 八分之一音符
  eighth(8),

  /// 十六分之一音符
  sixteenth(16);

  /// 音符时长对应真实时间
  final int value;

  const ProjectDuration(this.value);
}

ProjectDuration changeDoubleDuration(double value) => switch (value) {
  0 => .whole,
  4 => .half,
  8 => .quarter,
  12 => .eighth,
  16 => .sixteenth,
  _ => .quarter,
};

double changeDurationDouble(ProjectDuration value) => switch (value) {
  .whole => 0,
  .half => 4,
  .quarter => 8,
  .eighth => 12,
  .sixteenth => 16,
};

ProjectDuration carouselDuration(ProjectDuration value) {
  final nextIndex = (value.index + 1) % ProjectDuration.values.length;
  return ProjectDuration.values[nextIndex];
}
