import 'package:flutter/material.dart';

class ToneControlButton extends StatelessWidget {
  const ToneControlButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsetsGeometry.only(right: 16, bottom: 16),
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: "播放",
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
