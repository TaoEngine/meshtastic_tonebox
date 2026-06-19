import 'package:flutter/material.dart';

class ToneOptionHint extends StatelessWidget {
  final String hint;

  /// 乐谱选项的提示文字
  const ToneOptionHint({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(left: 24, right: 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 16,
        children: [
          Icon(Icons.info_outline, color: Theme.of(context).colorScheme.onSurface),
          Text(hint, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
