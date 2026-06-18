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
  String newName = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) {
        final name = project.name;

        return AlertDialog.adaptive(
          icon: Icon(Icons.drive_file_rename_outline),
          title: Text("修改乐谱标题"),
          content: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              Text("标题不能为空", textAlign: .left),
              Divider(height: 0),
              TextField(
                autofocus: true,
                enableIMEPersonalizedLearning: false,
                onChanged: (value) => newName = value,
                decoration: InputDecoration(filled: true, hintText: name),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newName.isNotEmpty) {
                  project.updateName(newName);
                } else {
                  _showRenameFailure(context);
                }
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

/// 打开乐谱项目重命名弹窗
void showToneOptionDialogRename(BuildContext context) => showDialog(
  context: context,
  builder: (context) => ToneOptionDialogRename(),
);

/// 重命名为空时出现的提示
void _showRenameFailure(BuildContext context) => ScaffoldMessenger.of(
  context,
).showSnackBar(SnackBar(content: Text("标题不能为空哦")));
