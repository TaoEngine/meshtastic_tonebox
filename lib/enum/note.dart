import 'package:flutter/widgets.dart';
import 'package:meshtastic/l10n/app_localizations.dart';

/// 乐谱名定义
enum Note {
  c(symbol: "C"),
  csharp(symbol: "C#"),
  d(symbol: "D"),
  dsharp(symbol: "D#"),
  e(symbol: "E"),
  f(symbol: "F"),
  fsharp(symbol: "F#"),
  g(symbol: "G"),
  gsharp(symbol: "G#"),
  a(symbol: "A"),
  asharp(symbol: "A#"),
  b(symbol: "B");

  final String symbol;
  const Note({required this.symbol});
}

/// 将八度定义转换为文字注释
String translateNote(BuildContext context, Note value) => switch (value) {
  .c => AppLocalizations.of(context)!.note_c,
  .csharp => AppLocalizations.of(context)!.note_csharp,
  .d => AppLocalizations.of(context)!.note_d,
  .dsharp => AppLocalizations.of(context)!.note_dsharp,
  .e => AppLocalizations.of(context)!.note_e,
  .f => AppLocalizations.of(context)!.note_f,
  .fsharp => AppLocalizations.of(context)!.note_fsharp,
  .g => AppLocalizations.of(context)!.note_g,
  .gsharp => AppLocalizations.of(context)!.note_gsharp,
  .a => AppLocalizations.of(context)!.note_a,
  .asharp => AppLocalizations.of(context)!.note_asharp,
  .b => AppLocalizations.of(context)!.note_b,
};
