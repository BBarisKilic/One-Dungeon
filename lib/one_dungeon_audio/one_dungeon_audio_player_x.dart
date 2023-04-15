import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

extension OneDungeonAudioPlayerX on OneDungeonAudioPlayer {
  List<Future<void> Function()> preLoadAudios(
    PreCacheSingleAudio preCacheSingleAudio,
  ) {
    return [
      () => preCacheSingleAudio(GameAssets.kBackgroudMusic),
      () => preCacheSingleAudio(GameAssets.kDescendingSfx),
      () => preCacheSingleAudio(GameAssets.kJumpSfx),
      () => preCacheSingleAudio(GameAssets.kLandingSfx),
      () => preCacheSingleAudio(GameAssets.kPickUpStarSfx),
      () => preCacheSingleAudio(GameAssets.kPickUpSfx),
      () => preCacheSingleAudio(GameAssets.kSelectSfx),
      () => preCacheSingleAudio(GameAssets.kSuccessSfx),
    ];
  }
}
