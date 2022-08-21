import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_dungeon/about/about.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/how_to_play/widgets/widgets.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/sound/sound.dart';
import 'package:one_dungeon/start_game/start_game.dart';

class StartGameListener extends StatelessWidget {
  const StartGameListener({super.key, required Widget child}) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final startGameCubit = context.read<StartGameCubit>();

    return BlocListener<StartGameCubit, StartGameState>(
      listener: (context, state) => state.when(
        initial: () => null,
        play: () {
          startGameCubit.setBackToInitial();
          return di.injector<OneDungeonGame>().startGame();
        },
        sound: () async {
          startGameCubit.setBackToInitial();
          return showDialog<SoundSettingsDialog>(
            context: context,
            barrierDismissible: false,
            builder: (_) => const SoundSettingsDialog(),
          );
        },
        language: () => null,
        howToPlay: () async {
          startGameCubit.setBackToInitial();
          return showDialog<HowToPlayDialog>(
            context: context,
            barrierDismissible: false,
            builder: (_) => const HowToPlayDialog(),
          );
        },
        about: () async {
          startGameCubit.setBackToInitial();
          return showDialog<AboutGameDialog>(
            context: context,
            barrierDismissible: false,
            builder: (_) => const AboutGameDialog(),
          );
        },
      ),
      child: _child,
    );
  }
}
