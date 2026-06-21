import 'package:flutter/material.dart';
import 'package:meshtastic/ui/widget/tone/edit/line.dart';
import 'package:meshtastic/ui/widget/tone/edit/reference.dart';
import 'package:meshtastic/ui/widget/tone/edit/texture.dart';

class ToneEditor extends StatelessWidget {
  const ToneEditor({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> toneList = List.generate(
      0,
      (int line) => Stack(
        children: [
          ToneEditTexture(lineEdit: line),
          ToneEditLine(line: line),
        ],
      ),
    );

    return Column(
      mainAxisSize: .max,
      children: [
        const ToneEditReference(),
        Expanded(child: ListView(children: toneList)),
      ],
    );
  }
}
