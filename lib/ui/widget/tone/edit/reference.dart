import 'package:flutter/material.dart';

class ToneEditReference extends StatelessWidget {
  const ToneEditReference({super.key});

  static const List<String> baseRef = ["C", "D", "E", "F", "G", "A", "B"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Flex(
        direction: .horizontal,
        children:
            baseRef
                .map((ref) => Expanded(child: Center(child: Text(ref))))
                .toList()
              ..add(Expanded(child: const Icon(Icons.timer, size: 15))),
      ),
    );
  }
}
