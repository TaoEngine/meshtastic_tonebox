import 'package:go_router/go_router.dart';
import 'package:meshtastic/ui/page/tone/edit.dart';
import 'package:meshtastic/ui/page/tone/file.dart';
import 'package:meshtastic/ui/page/tone/option.dart';
import 'package:meshtastic/ui/page/app/settings.dart';

final pageRouter = GoRouter(
  routes: [
    GoRoute(path: '/a', builder: (context, state) => ToneFilePage()),
    GoRoute(path: '/', builder: (context, state) => ToneEditPage()),
    GoRoute(path: '/option', builder: (context, state) => ToneOptionPage()),
    GoRoute(path: '/settings', builder: (context, state) => SettingsPage()),
  ],
);
