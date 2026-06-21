import 'package:flutter/material.dart';
import 'package:meshtastic/enum/project_duration.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:meshtastic/ui/widget/tone/edit/dialog/duration.dart';
import 'package:meshtastic/ui/widget/tone/edit/unit/duration.dart';
import 'package:provider/provider.dart';

class ToneEditLine extends StatelessWidget {
  /// 要编辑音符位于的行
  final int line;

  const ToneEditLine({super.key, required this.line});

  /// 点击左侧音名
  void onNoteTap(BoxConstraints constraints, TapDownDetails details) {
    final double widthTapMax = constraints.maxWidth;
    final double widthTap = details.localPosition.dx;
    final String tone = switch (widthTap / (widthTapMax / 7)) {
      >= 6 => "B",
      >= 5 => "A",
      >= 4 => "G",
      >= 3 => "F",
      >= 2 => "E",
      >= 1 => "D",
      >= 0 => "C",
      _ => "Error",
    };
    debugPrint("在第${line + 1}行点到了音符$tone");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) => SizedBox(
        height: 60,
        child: Flex(
          direction: .horizontal,
          children: [
            // 左侧音名
            Expanded(
              flex: 7,
              child: LayoutBuilder(
                builder: (context, constraints) => GestureDetector(
                  onTapDown: (details) => onNoteTap(constraints, details),
                ),
              ),
            ),
            // 右侧节拍
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  final duration = project.sheet[line].duration;
                  project.updateNoteDuration(line, carouselDuration(duration));
                },
                onLongPress: () =>
                    showToneEditDialogDuration(context, line),
                child: ToneEditUnitDuration(line: line),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
