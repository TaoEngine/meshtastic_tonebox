import 'package:flutter/material.dart';

class ToneOptionHint extends StatelessWidget {
  /// 乐谱选项的提示文字
  const ToneOptionHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(left: 24, right: 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 16,
        children: [
          Icon(
            Icons.info_outline,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          Text(
            "短按将直接打开设置弹窗，长按可查看选项的相关介绍和注意事项。其中乐谱BPM与拍号将直接影响直出的音乐效果",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
