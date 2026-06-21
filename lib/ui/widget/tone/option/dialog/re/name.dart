import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meshtastic/provider/tone_project.dart';
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
            title: Text("修改乐谱标题"),
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
                    labelText: "乐谱标题"
                  ),
                  autofocus: true,
                  enableIMEPersonalizedLearning: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "乐谱标题不能为空哦";
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
                child: Text("完成"),
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
