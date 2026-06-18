import 'package:flutter/material.dart';
import 'package:meshtastic/l10n/app_localizations.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:meshtastic/ui/widget/tone/option/dialog/rename.dart';
import 'package:meshtastic/ui/widget/tone/option/dialog/set/bpm.dart';
import 'package:meshtastic/ui/widget/tone/option/hint.dart';
import 'package:meshtastic/ui/widget/tone/option/menu.dart';
import 'package:provider/provider.dart';

class ToneOptionPage extends StatelessWidget {
  const ToneOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) {
        final name = project.name;
        final bpm = project.bpm;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.toneOptionPage_Title(name),
            ),
          ),
          body: Column(
            mainAxisSize: .max,
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              ToneOptionMenu(
                title: AppLocalizations.of(
                  context,
                )!.toneOptionPage_GeneralOptions,
                tiles: [
                  ListTile(
                    onTap: () => showToneOptionDialogRename(context),
                    leading: Icon(Icons.drive_file_rename_outline),
                    title: Text("乐谱标题"),
                    subtitle: Text("修改标题 “$name”"),
                  ),
                ],
              ),
              ToneOptionMenu(
                title: AppLocalizations.of(
                  context,
                )!.toneOptionPage_TheoryOptions,
                tiles: [
                  ListTile(
                    onTap: () => showToneOptionDialogSetBPM(context),
                    leading: Icon(Icons.speed),
                    title: Text("乐谱 BPM"),
                    subtitle: Text("当前为 $bpm"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.music_note),
                    title: Text("乐谱拍号"),
                    subtitle: Text("测试"),
                  ),
                ],
              ),
              const ToneOptionHint(),
            ],
          ),
        );
      },
    );
  }
}
