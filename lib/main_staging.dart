import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:one_dungeon/app/app.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  await di.initializeDependencies();

  await bootstrap(() => const App());
}
