import 'package:flutter/material.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/l10n/l10n.dart';

class HowToPlayDialog extends StatelessWidget {
  const HowToPlayDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: SizedBox(
        width: GameLayout.kGeneralWidth,
        child: Card(
          color: GameColors.kDialogBackgroundColor,
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
                  l10n.howToPlayText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: GameLayout.kLongVerticalSpace),
                Text(
                  l10n.howToPlayDetailText,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: GameLayout.kVerticalSpace),
                MenuButton(
                  onPressed: Navigator.of(context).pop,
                  text: l10n.backText,
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
