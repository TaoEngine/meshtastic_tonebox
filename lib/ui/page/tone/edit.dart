import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:meshtastic/ui/widget/tone/control/button.dart';
import 'package:meshtastic/ui/widget/tone/editor.dart';
import 'package:meshtastic/ui/widget/tone/edit/status.dart';
import 'package:provider/provider.dart';

class ToneEditPage extends StatelessWidget {
  const ToneEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToneProject>(
      builder: (context, project, child) => Scaffold(
        appBar: AppBar(
          title: Text(project.name, overflow: TextOverflow.ellipsis),
          actions: [
            IconButton(
              onPressed: () => context.push("/option"),
              icon: Icon(Icons.settings),
              tooltip: "乐谱设置",
            ),
            IconButton.filledTonal(
              onPressed: () {},
              icon: Icon(Icons.edit),
              tooltip: "切换编辑音符",
            ),
            SizedBox(width: 4),
          ],
        ),
        body: Column(
          mainAxisSize: .max,
          children: [
            Expanded(
              child: Stack(children: [ToneEditor(), ToneControlButton()]),
            ),
            ToneEditStatus(),
          ],
        ),
      ),
    );
  }
}
