import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:provider/provider.dart';

class ToneOptionDialogSetCount extends StatefulWidget {
  /// 乐谱项目调整行数弹窗
  const ToneOptionDialogSetCount({super.key});

  @override
  State<ToneOptionDialogSetCount> createState() => _ToneOptionDialogSetCountState();
}

class _ToneOptionDialogSetCountState extends State<ToneOptionDialogSetCount> {
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
            title: Text("修改乐谱长度"),
            content: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              spacing: 16,
              children: [
                Text("Meshtastic 设备可支持最长40行的乐谱。少于20行的，设备会播放两次", textAlign: .left),
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
                          labelText: "乐谱长度",
                        ),
                        autofocus: true,
                        keyboardType: .number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        enableIMEPersonalizedLearning: false,
                        validator: (value) {
                          if (value == null || value.isEmpty || int.parse(value) < 1) {
                            return "乐谱长度不能为空哦";
                          }
                          if (int.parse(value) > 40) {
                            return "对于设备来说这乐谱可太长了";
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
                child: Text("完成"),
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
    showDialog(context: context, builder: (context) => ToneOptionDialogSetCount());
