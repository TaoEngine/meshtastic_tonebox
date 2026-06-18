import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:provider/provider.dart';

class ToneOptionDialogSetBpm extends StatefulWidget {
  /// 乐谱项目调整 BPM 弹窗
  const ToneOptionDialogSetBpm({super.key});

  @override
  State<ToneOptionDialogSetBpm> createState() => _ToneOptionDialogSetBpmState();
}

class _ToneOptionDialogSetBpmState extends State<ToneOptionDialogSetBpm> {
  double newBpm = 120;

  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) {
        final bpm = project.bpm;

        return AlertDialog.adaptive(
          icon: Icon(Icons.speed),
          title: Text("修改乐谱 BPM"),
          content: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              Text(
                "当前 BPM 值为 $bpm，将调整 BPM 值为 ${newBpm.toInt()}",
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
                        newBpm = newBpm - 1;
                      }),
                      icon: Icon(Icons.remove),
                    ),
                    Expanded(
                      child: Slider(
                        value: newBpm,
                        min: 60,
                        max: 300,
                        onChanged: (value) => setState(() {
                          newBpm = value;
                        }),
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: () => setState(() {
                        newBpm = newBpm + 1;
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
                project.updateBpm(newBpm.toInt());
                context.pop();
              },
              child: Text("完成"),
            ),
          ],
        );
      },
    );
  }
}

/// 打开乐谱项目调整 BPM 弹窗
void showToneOptionDialogSetBPM(BuildContext context) => showDialog(
  context: context,
  builder: (context) => ToneOptionDialogSetBpm(),
);
