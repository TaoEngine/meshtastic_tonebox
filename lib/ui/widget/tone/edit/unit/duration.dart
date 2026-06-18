import 'package:flutter/material.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:provider/provider.dart';

class ToneEditUnitDuration extends StatelessWidget {
  /// 要编辑音符位于的行
  final int line;

  /// 音符时长指示块
  const ToneEditUnitDuration({super.key, required this.line});

  @override
  Widget build(BuildContext context) => Consumer<ToneProject>(
    builder: (context, project, child) {
      final note = project.notes[line];
      Color colorContainer = Theme.of(context).colorScheme.surfaceContainer;
      Color colorText = Theme.of(context).colorScheme.onSurface.withAlpha(50);
      if (note.duration.value != project.durationDefault.value || note.dotted) {
        colorContainer = Theme.of(context).colorScheme.tertiaryContainer;
        colorText = Theme.of(context).colorScheme.onTertiaryContainer;
      }

      return Padding(
        padding: const .all(3),
        child: AnimatedContainer(
          alignment: .center,
          decoration: BoxDecoration(
            borderRadius: .circular(5),
            color: colorContainer,
          ),
          curve: Curves.easeOut,
          duration: Durations.short4,
          child: Text(
            "${note.duration.value}${note.dotted ? "·" : ""}",
            style: TextStyle(color: colorText),
          ),
        ),
      );
    },
  );
}
