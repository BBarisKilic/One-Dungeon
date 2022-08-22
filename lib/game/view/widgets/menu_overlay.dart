import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/l10n/l10n.dart';
import 'package:one_dungeon/start_game/start_game.dart';

class MenuOverlay extends StatelessWidget {
  const MenuOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final startGameCubit = context.read<StartGameCubit>();
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
                  l10n.gameTitle,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: GameLayout.kLongVerticalSpace),
                MenuButton(
                  key: const Key('menuButton1'),
                  onPressed: startGameCubit.onPlayPressed,
                  text: l10n.playText,
                ),
                const SizedBox(height: GameLayout.kVerticalSpace),
                MenuButton(
                  key: const Key('menuButton2'),
                  onPressed: startGameCubit.onSoundPressed,
                  text: l10n.soundText,
                ),
                const SizedBox(height: GameLayout.kVerticalSpace),
                MenuButton(
                  key: const Key('menuButton3'),
                  onPressed: startGameCubit.onLanguagePressed,
                  text: l10n.languageText,
                ),
                const SizedBox(height: GameLayout.kVerticalSpace),
                MenuButton(
                  key: const Key('menuButton4'),
                  onPressed: startGameCubit.onHowToPlayPressed,
                  text: l10n.howToPlayText,
                ),
                const SizedBox(height: GameLayout.kVerticalSpace),
                MenuButton(
                  key: const Key('menuButton5'),
                  onPressed: startGameCubit.onAboutPressed,
                  text: l10n.aboutText,
                ),
                const SizedBox(height: GameLayout.kVerticalSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'v1.0.0',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 8,
                            color: GameColors.kButtonColor,
                          ),
                    ),
                    Text(
                      '2022 © BBK Games',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 8,
                            color: GameColors.kButtonColor,
                          ),
                    ),
                  ],
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
