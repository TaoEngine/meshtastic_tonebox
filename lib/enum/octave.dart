import 'package:flutter/widgets.dart';
import 'package:meshtastic/l10n/app_localizations.dart';

/// 乐谱八度定义
enum Octave {
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
  const Octave({required this.symbol});
}

/// 将八度定义转换为文字注释
String translateOctave(BuildContext context, Octave value) => switch (value) {
  .c => AppLocalizations.of(context)!.octave_c,
  .csharp => AppLocalizations.of(context)!.octave_csharp,
  .d => AppLocalizations.of(context)!.octave_d,
  .dsharp => AppLocalizations.of(context)!.octave_dsharp,
  .e => AppLocalizations.of(context)!.octave_e,
  .f => AppLocalizations.of(context)!.octave_f,
  .fsharp => AppLocalizations.of(context)!.octave_fsharp,
  .g => AppLocalizations.of(context)!.octave_g,
  .gsharp => AppLocalizations.of(context)!.octave_gsharp,
  .a => AppLocalizations.of(context)!.octave_a,
  .asharp => AppLocalizations.of(context)!.octave_asharp,
  .b => AppLocalizations.of(context)!.octave_b,
};
