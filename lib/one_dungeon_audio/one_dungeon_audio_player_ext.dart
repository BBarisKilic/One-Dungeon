import 'package:flame_audio/flame_audio.dart';
import 'package:one_dungeon/constants/game_assets.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

extension OneDungeonAudioPlayerExt on OneDungeonAudioPlayer {
  List<Future<void> Function()> preLoadAudios() {
    return [
      () async => FlameAudio.audioCache.load(GameAssets.kBackgroudMusic),
      () async => FlameAudio.audioCache.load(GameAssets.kDescendingSfx),
      () async => FlameAudio.audioCache.load(GameAssets.kJumpSfx),
      () async => FlameAudio.audioCache.load(GameAssets.kLandingSfx),
      () async => FlameAudio.audioCache.load(GameAssets.kPickUpStarSfx),
      () async => FlameAudio.audioCache.load(GameAssets.kPickUpSfx),
      () async => FlameAudio.audioCache.load(GameAssets.kSelectSfx),
      () async => FlameAudio.audioCache.load(GameAssets.kSuccessSfx),
    ];
  }
}
