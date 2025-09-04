import 'package:flutter/material.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/l10n/l10n.dart';

/// {@template about_game_dialog}
/// A dialog that shows information about the game.
/// {@endtemplate}
class AboutGameDialog extends StatelessWidget {
  /// {@macro about_game_dialog}
  const AboutGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: SizedBox(
        height: GameLayout.generalHeight,
        width: GameLayout.generalWidth,
        child: Card(
          color: GameColors.dialogBackgroundColor,
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: GameLayout.buttonPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: GameLayout.verticalSpace),
                Text(
                  l10n.aboutText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: GameLayout.longVerticalSpace),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      l10n.aboutDetailText,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: GameLayout.verticalSpace),
                MenuButton(
                  onPressed: Navigator.of(context).pop,
                  text: l10n.backText,
                ),
                const SizedBox(height: GameLayout.verticalSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
