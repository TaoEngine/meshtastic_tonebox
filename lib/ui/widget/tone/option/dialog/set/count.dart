import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ToneOptionDialogSetCount extends StatefulWidget {
  /// 乐谱项目调整行数弹窗
  const ToneOptionDialogSetCount({super.key});

  @override
  State<ToneOptionDialogSetCount> createState() => _ToneOptionDialogSetCountState();
}

class _ToneOptionDialogSetCountState extends State<ToneOptionDialogSetCount> {
  final _controller = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _controller.addListener((){});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return AlertDialog.adaptive(
          icon: Icon(Icons.grid_4x4),
          title: Text("修改乐谱行数"),
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
                  IconButton.filledTonal(
                    onPressed: () => setState(() {}),
                    icon: Icon(Icons.remove),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      autofocus: true,
                      keyboardType: .number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textAlign: .center,
                      enableIMEPersonalizedLearning: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "不能为空";
                        }
                      },
                      decoration: InputDecoration(filled: true),
                    ),
                  ),
                  IconButton.filledTonal(onPressed: () => setState(() {}), icon: Icon(Icons.add)),
                ],
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

/// 打开乐谱项目调整行数弹窗
void showToneOptionDialogSetCount(BuildContext context) =>
    showDialog(context: context, builder: (context) => ToneOptionDialogSetCount());
