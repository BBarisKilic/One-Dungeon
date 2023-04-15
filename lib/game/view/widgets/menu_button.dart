import 'package:flutter/material.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final audioPlayer = di.injector<OneDungeonAudioPlayer>();

    return ElevatedButton(
      onPressed: () {
        if (di.injector<OneDungeonAudioPlayer>().isFirstRun) {
          di.injector<OneDungeonAudioPlayer>().isFirstRun = false;
          di.injector<OneDungeonAudioPlayer>().isBackgroundMusicActive = true;
          di.injector<OneDungeonAudioPlayer>().isSfxActive = true;
        }

        onPressed();
        audioPlayer.play(OneDungeonAudio.pickUp);
      },
      child: Text(text),
      onHover: (value) =>
          value ? audioPlayer.play(OneDungeonAudio.select) : null,
    );
  }
}
