import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

class TestAudioPlayer extends OneDungeonAudioPlayer {
  TestAudioPlayer()
      : super.test(
          playBackgroundAudio: (_, {double? volume}) async {},
          stopBackgroundAudio: () async {},
          playSingleAudio: (_, {double? volume}) async {},
          preCacheSingleAudio: (_) async {},
        );
}
