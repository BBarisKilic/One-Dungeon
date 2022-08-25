import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

extension OneDungeonAudioPlayerX on OneDungeonAudioPlayer {
  List<Future<void> Function()> preLoadAudios(
    PreCacheSingleAudio preCacheSingleAudio,
  ) {
    return [
      () async => preCacheSingleAudio(GameAssets.kBackgroudMusic),
      () async => preCacheSingleAudio(GameAssets.kDescendingSfx),
      () async => preCacheSingleAudio(GameAssets.kJumpSfx),
      () async => preCacheSingleAudio(GameAssets.kLandingSfx),
      () async => preCacheSingleAudio(GameAssets.kPickUpStarSfx),
      () async => preCacheSingleAudio(GameAssets.kPickUpSfx),
      () async => preCacheSingleAudio(GameAssets.kSelectSfx),
      () async => preCacheSingleAudio(GameAssets.kSuccessSfx),
    ];
  }
}
