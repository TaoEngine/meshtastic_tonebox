import 'package:flutter/material.dart';

class ToneOptionMenu extends StatelessWidget {
  /// 菜单标题
  final String title;

  /// 菜单的子元素
  final List<Widget> tiles;

  /// 选项菜单
  const ToneOptionMenu({super.key, required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        spacing: 4,
        children: [
          Padding(
            padding: const .only(left: 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          Card.filled(
            clipBehavior: .antiAlias,
            child: Center(
              child: Column(
                mainAxisSize: .min,
                mainAxisAlignment: .center,
                children: tiles
                    .expand((tile) => [tile, Divider(height: 0)])
                    .take(tiles.length * 2 - 1)
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
