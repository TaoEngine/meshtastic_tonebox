import 'package:flutter/material.dart';
import 'package:meshtastic/enum/note.dart';
import 'package:meshtastic/l10n/app_localizations.dart';
import 'package:meshtastic/provider/tone/project.dart';
import 'package:meshtastic/ui/widget/tone/option/dialog/re/name.dart';
import 'package:meshtastic/ui/widget/tone/option/dialog/set/bpm.dart';
import 'package:meshtastic/ui/widget/tone/option/dialog/re/length.dart';
import 'package:meshtastic/ui/widget/tone/option/dialog/set/key.dart';
import 'package:meshtastic/ui/widget/tone/option/hint.dart';
import 'package:meshtastic/ui/widget/tone/option/menu.dart';
import 'package:provider/provider.dart';

class ToneOptionPage extends StatefulWidget {
  const ToneOptionPage({super.key});

  @override
  State<ToneOptionPage> createState() => _ToneOptionPageState();
}

class _ToneOptionPageState extends State<ToneOptionPage> with WidgetsBindingObserver {
  Future<void> _safeSave() async {
    final project = context.read<ToneProject>();
    final uuid = await project.saveProject();
    debugPrint("保存了项目 $uuid");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _safeSave();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == .paused || state == .inactive) _safeSave();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) {
        final name = project.name;
        final length = project.length;
        final bpm = project.bpm;
        final key = project.key;
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
                    subtitle: Text(AppLocalizations.of(context)!.option_count_subtitle(length)),
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
                    onTap: () => showToneOptionDialogSetKey(context),
                    leading: Icon(Icons.music_note),
                    title: Text(AppLocalizations.of(context)!.option_key_title),
                    subtitle: Text(
                      AppLocalizations.of(
                        context,
                      )!.option_key_subtitle(translateNote(context, key)),
                    ),
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
