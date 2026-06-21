import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meshtastic/enum/octave.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:provider/provider.dart';

class ToneOptionDialogSetKey extends StatefulWidget {
  /// 乐谱
  const ToneOptionDialogSetKey({super.key});

  @override
  State<ToneOptionDialogSetKey> createState() => _ToneOptionDialogSetKeyState();
}

class _ToneOptionDialogSetKeyState extends State<ToneOptionDialogSetKey> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) {
        final key = project.key;

        return AlertDialog.adaptive(
          icon: Icon(Icons.music_note),
          title: Text("修改乐谱调号"),
          content: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .center,
            spacing: 16,
            children: [
              Text("此处的操作相当于将乐谱的C大调映射为${translateOctave(context, key)}", textAlign: .left),
              Divider(height: 0),
              DropdownMenu<Octave>(
                initialSelection: key,
                dropdownMenuEntries: Octave.values
                    .map(
                      (octave) => DropdownMenuEntry<Octave>(
                        value: octave,
                        label: "${translateOctave(context, octave)} (${octave.symbol})",
                      ),
                    )
                    .toList(),
                onSelected: (value) => setState(() {
                  project.updateKey(value!);
                }),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
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

void showToneOptionDialogSetKey(BuildContext context) =>
    showDialog(context: context, builder: (context) => ToneOptionDialogSetKey());
