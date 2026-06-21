import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meshtastic/l10n/app_localizations.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:provider/provider.dart';

class ToneOptionDialogSetBpm extends StatefulWidget {
  /// 乐谱项目调整 BPM 弹窗
  const ToneOptionDialogSetBpm({super.key});

  @override
  State<ToneOptionDialogSetBpm> createState() => _ToneOptionDialogSetBpmState();
}

class _ToneOptionDialogSetBpmState extends State<ToneOptionDialogSetBpm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) {
        final bpm = project.bpm;

        return AlertDialog.adaptive(
          icon: Icon(Icons.speed),
          title: Text(AppLocalizations.of(context)!.option_dialog_setbpm_title),
          content: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              Text(
                AppLocalizations.of(context)!.option_dialog_setbpm_subtitle(bpm),
                textAlign: .left,
              ),
              Divider(height: 0),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisSize: .max,
                  crossAxisAlignment: .center,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () => setState(() {
                        project.updateBpm(bpm - 1);
                      }),
                      icon: Icon(Icons.remove),
                    ),
                    Expanded(
                      child: Slider(
                        value: bpm.toDouble(),
                        min: 60,
                        max: 300,
                        onChanged: (value) => setState(() {
                          project.updateBpm(value.toInt());
                        }),
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: () => setState(() {
                        project.updateBpm(bpm + 1);
                      }),
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(AppLocalizations.of(context)!.conform),
            ),
          ],
        );
      },
    );
  }
}

/// 打开乐谱项目调整 BPM 弹窗
void showToneOptionDialogSetBPM(BuildContext context) =>
    showDialog(context: context, builder: (context) => ToneOptionDialogSetBpm());
