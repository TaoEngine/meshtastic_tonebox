import 'package:flutter/material.dart';

class ToneEditTexture extends StatelessWidget {
  /// 编辑行位于的行数
  final int lineEdit;

  /// 音符编辑行底纹
  const ToneEditTexture({super.key, required this.lineEdit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Flex(
        direction: .horizontal,
        children: List.generate(8, (int block) {
          Text? blockSign = switch (block) {
            0 => Text(
              "${lineEdit + 1}",
              style: TextStyle(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
            ),
            _ => null,
          };
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                ),
              ),
              child: Center(child: blockSign),
            ),
          );
        }),
      ),
    );
  }
}
