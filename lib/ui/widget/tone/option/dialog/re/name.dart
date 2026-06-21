import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meshtastic/l10n/app_localizations.dart';
import 'package:meshtastic/provider/tone/project.dart';
import 'package:provider/provider.dart';

class ToneOptionDialogRename extends StatefulWidget {
  /// 乐谱项目重命名弹窗
  const ToneOptionDialogRename({super.key});

  @override
  State<ToneOptionDialogRename> createState() => _ToneOptionDialogRenameState();
}

class _ToneOptionDialogRenameState extends State<ToneOptionDialogRename> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) {
        final name = project.name;

        return Form(
          key: _form,
          child: AlertDialog.adaptive(
            icon: const Icon(Icons.drive_file_rename_outline),
            title: Text(AppLocalizations.of(context)!.option_dialog_rename_title),
            content: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              spacing: 16,
              children: [
                Divider(height: 0),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    hintText: name,
                    labelText: AppLocalizations.of(context)!.option_dialog_rename_label,
                  ),
                  autofocus: true,
                  enableIMEPersonalizedLearning: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.option_dialog_rename_validator;
                    }
                    return null;
                  },
                  onChanged: (_) => _form.currentState!.validate(),
                  onSaved: (newValue) => project.updateName(newValue!),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    _form.currentState!.save();
                    context.pop();
                  }
                },
                child: Text(AppLocalizations.of(context)!.conform),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// 打开乐谱项目重命名弹窗
void showToneOptionDialogRename(BuildContext context) =>
    showDialog(context: context, builder: (context) => ToneOptionDialogRename());
