import 'package:flame_audio/flame_audio.dart';
import 'package:one_dungeon/constants/game_assets.dart';

enum OneDungeonAudio {
  /// Background music.
  backgroundMusic,

  /// Descending Sfx.
  descending,

  /// Jump Sfx.
  jump,

  /// Landing Sfx.
  landing,

  /// Pick Up Sfx.
  pickUp,

  /// Pick Up Star Sfx.
  pickUpStar,

  /// Select Sfx.
  select,

  /// Success Sfx.
  success,
}

/// {@template one_dungeon_audio_player}
/// Sound manager for the OneDungeon game.
/// {@endtemplate}
class OneDungeonAudioPlayer {
  /// {@macro one_dungeon_audio_player}
  OneDungeonAudioPlayer({
    this.isFirstRun = true,
    this.isBackgroundMusicActive = false,
    this.isSfxActive = false,
  }) {
    FlameAudio.audioCache.prefix = '';
  }

  /// On the web platform, it is not possible to play
  /// audio until the first interaction.
  bool isFirstRun;

  bool isBackgroundMusicActive;

  bool isSfxActive;

  /// Plays the received audio.
  Future<void> play(OneDungeonAudio audio) async {
    if (isFirstRun) return;

    switch (audio) {
      case OneDungeonAudio.backgroundMusic:
        if (!isBackgroundMusicActive) return;
        await FlameAudio.bgm.play(GameAssets.kBackgroudMusic, volume: 0.5);
        break;
      case OneDungeonAudio.descending:
        if (!isSfxActive) return;
        await FlameAudio.play(GameAssets.kDescendingSfx);
        break;
      case OneDungeonAudio.jump:
        await FlameAudio.play(GameAssets.kJumpSfx);
        break;
      case OneDungeonAudio.landing:
        if (!isSfxActive) return;
        await FlameAudio.play(GameAssets.kLandingSfx);
        break;
      case OneDungeonAudio.pickUp:
        if (!isSfxActive) return;
        await FlameAudio.play(GameAssets.kPickUpSfx);
        break;
      case OneDungeonAudio.pickUpStar:
        if (!isSfxActive) return;
        await FlameAudio.play(GameAssets.kPickUpStarSfx);
        break;
      case OneDungeonAudio.select:
        if (!isSfxActive) return;
        await FlameAudio.play(GameAssets.kSelectSfx);
        break;
      case OneDungeonAudio.success:
        await FlameAudio.play(GameAssets.kSuccessSfx);
        break;
    }
  }

  /// Stops background music.
  Future<void> stop() async => FlameAudio.bgm.stop();
}
