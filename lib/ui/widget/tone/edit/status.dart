import 'package:flutter/material.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:provider/provider.dart';

class ToneEditStatus extends StatelessWidget {
  /// 音符状态栏
  const ToneEditStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) {
        final length = project.length;
        final count = project.notesCount;
        final key = project.key.symbol;
        final bpm = project.bpm;

        return Container(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [Icon(Icons.music_note), Text(key)],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [Icon(Icons.play_arrow), Text("$count / $length")],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [Icon(Icons.speed), Text("$bpm")],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
