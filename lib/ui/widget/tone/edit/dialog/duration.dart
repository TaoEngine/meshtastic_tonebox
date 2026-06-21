import 'package:flutter/material.dart';
import 'package:meshtastic/enum/project_duration.dart';
import 'package:meshtastic/provider/tone/project.dart';
import 'package:meshtastic/ui/widget/tone/edit/unit/duration.dart';
import 'package:provider/provider.dart';

class ToneEditDialogDuration extends StatefulWidget {
  /// 要编辑音符位于的行
  final int line;

  /// 音符时长设置弹窗
  const ToneEditDialogDuration({super.key, required this.line});

  @override
  State<ToneEditDialogDuration> createState() => _ToneEditDialogDurationState();
}

class _ToneEditDialogDurationState extends State<ToneEditDialogDuration> {
  ProjectDuration duration = .quarter;
  bool dotted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const .only(bottom: 16),
        child: Consumer<ToneProject>(
          builder: (context, project, _) {
            final notes = project.sheet[widget.line];
            duration = notes.duration;
            dotted = notes.dotted;

            return Column(
              mainAxisSize: .min,
              spacing: 8,
              children: [
                Padding(
                  padding: const .only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    mainAxisSize: .max,
                    children: [
                      Text(
                        "调整音符${widget.line + 1}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        width: 40,
                        height: 45,
                        child: ToneEditUnitDuration(line: widget.line),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const .only(left: 16, right: 16),
                  child: Row(
                    mainAxisSize: .max,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("时长", style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                        "${duration.value}分${dotted ? "半" : ""}音符",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: .bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Slider.adaptive(
                  min: 0,
                  max: 16,
                  divisions: 4,
                  value: changeDurationDouble(duration),
                  onChanged: (value) => setState(() {
                    project.updateSheetDuration(
                      widget.line,
                      changeDoubleDuration(value),
                    );
                  }),
                ),
                Padding(
                  padding: const .only(left: 16, right: 16),
                  child: Row(
                    mainAxisSize: .max,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("附点", style: Theme.of(context).textTheme.bodyMedium),
                      Switch(
                        value: dotted,
                        onChanged: (value) => setState(() {
                          project.updateSheetDotted(widget.line, value);
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// 打开音符时长设置弹窗
void showToneEditDialogDuration(BuildContext context, int line) =>
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) => ToneEditDialogDuration(line: line),
    );
