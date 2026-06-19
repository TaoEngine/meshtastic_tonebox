import 'package:flutter/material.dart';
import 'package:meshtastic/l10n/app_localizations.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:meshtastic/ui/widget/tone/option/dialog/rename.dart';
import 'package:meshtastic/ui/widget/tone/option/dialog/set/bpm.dart';
import 'package:meshtastic/ui/widget/tone/option/dialog/set/count.dart';
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
        final lines = 40;
        final bpm = project.bpm;
        final key = "C大调";
        return Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.option_title(name))),
          body: Column(
            mainAxisSize: .max,
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              ToneOptionMenu(
                title: AppLocalizations.of(context)!.option_general_title,
                tiles: [
                  ListTile(
                    onTap: () => showToneOptionDialogRename(context),
                    leading: Icon(Icons.drive_file_rename_outline),
                    title: Text(AppLocalizations.of(context)!.option_name_title),
                    subtitle: Text(AppLocalizations.of(context)!.option_name_subtitle(name)),
                  ),
                  ListTile(
                    onTap: () => showToneOptionDialogSetCount(context),
                    leading: Icon(Icons.grid_4x4),
                    title: Text(AppLocalizations.of(context)!.option_count_title),
                    subtitle: Text(AppLocalizations.of(context)!.option_count_subtitle(lines)),
                  ),
                ],
              ),
              ToneOptionMenu(
                title: AppLocalizations.of(context)!.option_theory_title,
                tiles: [
                  ListTile(
                    onTap: () => showToneOptionDialogSetBPM(context),
                    leading: Icon(Icons.speed),
                    title: Text(AppLocalizations.of(context)!.option_bpm_title),
                    subtitle: Text(AppLocalizations.of(context)!.option_bpm_subtitle(bpm)),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.music_note),
                    title: Text(AppLocalizations.of(context)!.option_key_title),
                    subtitle: Text(AppLocalizations.of(context)!.option_key_subtitle(key)),
                  ),
                ],
              ),
              ToneOptionHint(hint: AppLocalizations.of(context)!.option_hint),
            ],
          ),
        );
      },
    );
  }
}
