import 'package:flutter/material.dart';
import 'package:one_dungeon/bootstrap.dart';
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
    final audioPlayer = getIt<OneDungeonAudioPlayer>();

    return ElevatedButton(
      onPressed: () {
        if (audioPlayer.isFirstRun) {
          audioPlayer
            ..isFirstRun = false
            ..isBackgroundMusicActive = true
            ..isSfxActive = true;
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
