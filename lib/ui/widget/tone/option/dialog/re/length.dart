import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:meshtastic/l10n/app_localizations.dart';
import 'package:meshtastic/provider/tone/project.dart';
import 'package:provider/provider.dart';

class ToneOptionDialogRelength extends StatefulWidget {
  /// 乐谱项目调整行数弹窗
  const ToneOptionDialogRelength({super.key});

  @override
  State<ToneOptionDialogRelength> createState() => _ToneOptionDialogRelengthState();
}

class _ToneOptionDialogRelengthState extends State<ToneOptionDialogRelength> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) {
        final length = project.length;

        return Form(
          key: _form,
          child: AlertDialog.adaptive(
            icon: const Icon(Icons.grid_4x4),
            title: Text(AppLocalizations.of(context)!.option_dialog_relength_title),
            content: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              spacing: 16,
              children: [
                Text(
                  AppLocalizations.of(context)!.option_dialog_relength_subtitle,
                  textAlign: .left,
                ),
                Divider(height: 0),
                Row(
                  mainAxisSize: .max,
                  crossAxisAlignment: .center,
                  spacing: 16,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          hintText: length.toString(),
                          labelText: AppLocalizations.of(context)!.option_dialog_relength_label,
                        ),
                        autofocus: true,
                        keyboardType: .number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        enableIMEPersonalizedLearning: false,
                        validator: (value) {
                          if (value == null || value.isEmpty || int.parse(value) < 1) {
                            return AppLocalizations.of(
                              context,
                            )!.option_dialog_relength_validator_empty;
                          }
                          if (int.parse(value) > 40) {
                            return AppLocalizations.of(
                              context,
                            )!.option_dialog_relength_validator_long;
                          }
                          return null;
                        },
                        onChanged: (_) => _form.currentState!.validate(),
                        onSaved: (newValue) {
                          final newValueNum = int.parse(newValue!);
                          project.updateLength(newValueNum);
                        },
                      ),
                    ),
                  ],
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

/// 打开乐谱项目调整行数弹窗
void showToneOptionDialogSetCount(BuildContext context) =>
    showDialog(context: context, builder: (context) => ToneOptionDialogRelength());
