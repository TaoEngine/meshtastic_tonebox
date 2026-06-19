import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToneOptionDialogSetCount extends StatefulWidget {
  /// 乐谱项目调整行数弹窗
  const ToneOptionDialogSetCount({super.key});

  @override
  State<ToneOptionDialogSetCount> createState() => _ToneOptionDialogSetCountState();
}

class _ToneOptionDialogSetCountState extends State<ToneOptionDialogSetCount> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return AlertDialog.adaptive();
      },
    );
  }
}
