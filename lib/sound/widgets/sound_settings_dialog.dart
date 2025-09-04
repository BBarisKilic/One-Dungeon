import 'package:flutter/material.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/l10n/l10n.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';
import 'package:sharp_toggle_switch/sharp_toggle_switch.dart';

class SoundSettingsDialog extends StatelessWidget {
  const SoundSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final audioPlayer = getIt<OneDungeonAudioPlayer>();
    final l10n = context.l10n;

    return Center(
      child: SizedBox(
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
                  l10n.soundText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: GameLayout.longVerticalSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l10n.backgroundMusicText),
                    SharpToggleSwitch(
                      initialPosition: audioPlayer.isBackgroundMusicActive
                          ? SwitchPosition.right
                          : SwitchPosition.left,
                      onToggle: (position) {
                        if (position == SwitchPosition.left) {
                          audioPlayer.isBackgroundMusicActive = false;
                        } else {
                          audioPlayer.isBackgroundMusicActive = true;
                        }
                      },
                      leftSwitch: l10n.offText,
                      rightSwitch: l10n.onText,
                    ),
                  ],
                ),
                const SizedBox(height: GameLayout.verticalSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l10n.sfxText),
                    SharpToggleSwitch(
                      initialPosition: audioPlayer.isSfxActive
                          ? SwitchPosition.right
                          : SwitchPosition.left,
                      onToggle: (position) {
                        if (position == SwitchPosition.left) {
                          audioPlayer.isSfxActive = false;
                        } else {
                          audioPlayer.isSfxActive = true;
                        }
                      },
                      leftSwitch: l10n.offText,
                      rightSwitch: l10n.onText,
                    ),
                  ],
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
