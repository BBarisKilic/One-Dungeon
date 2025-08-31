import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_dungeon/about/about.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/how_to_play/how_to_play.dart';
import 'package:one_dungeon/sound/sound.dart';
import 'package:one_dungeon/start_game/start_game.dart';

class StartGameListener extends StatelessWidget {
  const StartGameListener({required Widget child, super.key}) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartGameCubit, StartGameState>(
      listener: (context, state) {
        switch (state) {
          case Menu():
            break;
          case Play():
            getIt<OneDungeonGame>().startGame();
          case Sound():
            showDialog<SoundSettingsDialog>(
              context: context,
              barrierDismissible: false,
              builder: (_) => const SoundSettingsDialog(),
            );
          case Language():
            break;
          case HowToPlay():
            showDialog<HowToPlayDialog>(
              context: context,
              barrierDismissible: false,
              builder: (_) => const HowToPlayDialog(),
            );
          case About():
            showDialog<AboutGameDialog>(
              context: context,
              barrierDismissible: false,
              builder: (_) => const AboutGameDialog(),
            );
        }
      },
      child: _child,
    );
  }
}
