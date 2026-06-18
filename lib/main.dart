import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:meshtastic/l10n/app_localizations.dart';
import 'package:meshtastic/provider/tone_project.dart';
import 'package:meshtastic/ui/page/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ToneProject(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        if (lightDynamic != null && darkDynamic != null) {
          lightDynamic = ColorScheme.fromSeed(
            seedColor: Color(lightDynamic.primary.toARGB32()),
            brightness: Brightness.light,
          );
          darkDynamic = ColorScheme.fromSeed(
            seedColor: Color(darkDynamic.primary.toARGB32()),
            brightness: Brightness.dark,
          );
        }

        return MaterialApp.router(
          routerConfig: pageRouter,
          title: 'Meshtastic Tonebox',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            // ignore: deprecated_member_use
            progressIndicatorTheme: ProgressIndicatorThemeData(year2023: false),
            // ignore: deprecated_member_use
            sliderTheme: SliderThemeData(year2023: false),
            colorScheme: lightDynamic,
          ),
          darkTheme: ThemeData(
            // ignore: deprecated_member_use
            progressIndicatorTheme: ProgressIndicatorThemeData(year2023: false),
            // ignore: deprecated_member_use
            sliderTheme: SliderThemeData(year2023: false),
            colorScheme: darkDynamic,
          ),
        );
      },
    );
  }
}
