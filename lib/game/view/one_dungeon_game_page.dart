import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/start_game/start_game.dart';

class OneDungeonGamePage extends StatelessWidget {
  const OneDungeonGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetsManagerCubit, AssetsManagerState>(
      builder: (context, state) {
        return state.isLoading
            ? LoadingPage(progress: state.progress)
            : const OneDungeonGameLoadedView();
      },
    );
  }
}

@visibleForTesting
class OneDungeonGameLoadedView extends StatelessWidget {
  const OneDungeonGameLoadedView({super.key, this.initialActiveOverlays});

  final List<String>? initialActiveOverlays;

  @override
  Widget build(BuildContext context) {
    final game = di.injector<OneDungeonGame>();

    return StartGameListener(
      child: MouseRegion(
        onHover: (_) {
          if (!game.focusNode.hasFocus) {
            game.focusNode.requestFocus();
          }
        },
        child: GameWidget<OneDungeonGame>(
          game: game,
          focusNode: game.focusNode,
          initialActiveOverlays:
              initialActiveOverlays ?? [OneDungeonGame.menuOverlay],
          overlayBuilderMap: {
            OneDungeonGame.menuOverlay: (_, __) => const MenuOverlay(),
            OneDungeonGame.gameOverMenuOverlay: (_, __) =>
                const GameOverMenuOverlay(),
          },
        ),
      ),
    );
  }
}
