import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

extension OneDungeonAudioPlayerX on OneDungeonAudioPlayer {
  List<Future<void> Function()> preLoadAudios(
    PreCacheSingleAudio preCacheSingleAudio,
  ) {
    return [
      () => preCacheSingleAudio(GameAssets.backgroundMusic),
      () => preCacheSingleAudio(GameAssets.descendingSfx),
      () => preCacheSingleAudio(GameAssets.jumpSfx),
      () => preCacheSingleAudio(GameAssets.landingSfx),
      () => preCacheSingleAudio(GameAssets.pickUpStarSfx),
      () => preCacheSingleAudio(GameAssets.pickUpSfx),
      () => preCacheSingleAudio(GameAssets.selectSfx),
      () => preCacheSingleAudio(GameAssets.successSfx),
    ];
  }
}
