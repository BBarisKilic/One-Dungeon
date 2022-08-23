import 'package:flutter/material.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/l10n/l10n.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio_player.dart';
import 'package:sharp_toggle_switch/sharp_toggle_switch.dart';

class SoundSettingsDialog extends StatelessWidget {
  const SoundSettingsDialog({super.key});

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
                  l10n.soundText,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: GameLayout.kLongVerticalSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l10n.backgroundMusicText),
                    SharpToggleSwitch(
                      initialPosition: SwitchPosition.right,
                      onToggle: _setBackgroundMusic,
                      leftSwitch: l10n.offText,
                      rightSwitch: l10n.onText,
                    ),
                  ],
                ),
                const SizedBox(height: GameLayout.kVerticalSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l10n.sfxText),
                    SharpToggleSwitch(
                      initialPosition: SwitchPosition.right,
                      onToggle: _setSfx,
                      leftSwitch: l10n.offText,
                      rightSwitch: l10n.onText,
                    ),
                  ],
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

  void _setBackgroundMusic(SwitchPosition position) {
    final audioPlayer = di.injector<OneDungeonAudioPlayer>();

    if (position == SwitchPosition.left) {
      audioPlayer.isBackgroundMusicActive = false;
    } else {
      audioPlayer.isBackgroundMusicActive = true;
    }
  }

  void _setSfx(SwitchPosition position) {
    final audioPlayer = di.injector<OneDungeonAudioPlayer>();

    if (position == SwitchPosition.left) {
      audioPlayer.isSfxActive = false;
    } else {
      audioPlayer.isSfxActive = true;
    }
  }
}
