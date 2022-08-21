import 'package:flutter/material.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/l10n/l10n.dart';

class CompletionMenuOverlay extends StatelessWidget {
  const CompletionMenuOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final game = di.injector<OneDungeonGame>();
    final l10n = context.l10n;

    return Center(
      child: SizedBox(
        width: GameLayout.kGeneralWidth,
        child: Card(
          color: GameColors.kMenuBackgroundColor,
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: GameLayout.kButtonPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: GameLayout.kVerticalSpace),
                Text(
                  l10n.gameOverText,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: GameLayout.kLongVerticalSpace),
                Text(
                  '${l10n.yourScoreText} ${game.score}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: GameLayout.kLongVerticalSpace),
                MenuButton(
                  onPressed: game.restartGame,
                  text: l10n.replayText,
                ),
                const SizedBox(height: GameLayout.kVerticalSpace),
                MenuButton(
                  onPressed: () {
                    game.overlays.remove(OneDungeonGame.completionMenuOverlay);
                    game.overlays.add(OneDungeonGame.menuOverlay);
                  },
                  text: l10n.exitToMenuText,
                ),
                const SizedBox(height: GameLayout.kVerticalSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
