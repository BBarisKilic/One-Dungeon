import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:one_dungeon/constants/constants.dart';

/// Available audio catalog.
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

/// Defines the contract for playing a single audio.
typedef PlayBackgroundAudio = Future<void> Function(String, {double volume});

/// Defines the contract for pre fetching an audio.
typedef StopBackgroundAudio = Future<void> Function();

/// Defines the contract for playing a single audio.
typedef PlaySingleAudio = Future<void> Function(String, {double volume});

/// Defines the contract for pre fetching an audio.
typedef PreCacheSingleAudio = Future<void> Function(String);

/// {@template one_dungeon_audio_player}
/// Sound manager for the OneDungeon game.
/// {@endtemplate}
class OneDungeonAudioPlayer {
  /// {@macro one_dungeon_audio_player}
  OneDungeonAudioPlayer({
    bool? isFirstRun,
    bool? isBackgroundMusicActive,
    bool? isSfxActive,
  }) : this._(
          playBackgroundAudio: FlameAudio.bgm.play,
          stopBackgroundAudio: FlameAudio.bgm.stop,
          playSingleAudio: FlameAudio.play,
          preCacheSingleAudio: FlameAudio.audioCache.load,
          isFirstRun: isFirstRun ?? true,
          isBackgroundMusicActive: isBackgroundMusicActive ?? false,
          isSfxActive: isSfxActive ?? false,
        );

  OneDungeonAudioPlayer._({
    required PlayBackgroundAudio playBackgroundAudio,
    required StopBackgroundAudio stopBackgroundAudio,
    required PlaySingleAudio playSingleAudio,
    required this.preCacheSingleAudio,
    required this.isFirstRun,
    required this.isBackgroundMusicActive,
    required this.isSfxActive,
  })  : _playBackgroundAudio = playBackgroundAudio,
        _stopBackgroundAudio = stopBackgroundAudio,
        _playSingleAudio = playSingleAudio {
    FlameAudio.audioCache.prefix = '';
  }

  @visibleForTesting
  OneDungeonAudioPlayer.test({
    required PlayBackgroundAudio playBackgroundAudio,
    required StopBackgroundAudio stopBackgroundAudio,
    required PlaySingleAudio playSingleAudio,
    required PreCacheSingleAudio preCacheSingleAudio,
    bool? isFirstRun,
    bool? isBackgroundMusicActive,
    bool? isSfxActive,
  }) : this._(
          playBackgroundAudio: playBackgroundAudio,
          stopBackgroundAudio: stopBackgroundAudio,
          playSingleAudio: playSingleAudio,
          preCacheSingleAudio: preCacheSingleAudio,
          isFirstRun: isFirstRun ?? true,
          isBackgroundMusicActive: isBackgroundMusicActive ?? false,
          isSfxActive: isSfxActive ?? false,
        );

  /// On the web platform, it is not possible to play
  /// audio until the first interaction.
  bool isFirstRun;

  bool isBackgroundMusicActive;

  bool isSfxActive;

  final PlayBackgroundAudio _playBackgroundAudio;

  final StopBackgroundAudio _stopBackgroundAudio;

  final PlaySingleAudio _playSingleAudio;

  final PreCacheSingleAudio preCacheSingleAudio;

  /// Plays the received audio.
  Future<void> play(OneDungeonAudio audio) async {
    if (isFirstRun) return;

    switch (audio) {
      case OneDungeonAudio.backgroundMusic:
        if (!isBackgroundMusicActive) return;
        return _playBackgroundAudio(GameAssets.backgroundMusic, volume: 0.5);
      case OneDungeonAudio.descending:
        if (!isSfxActive) return;
        return _playSingleAudio(GameAssets.descendingSfx);
      case OneDungeonAudio.jump:
        if (!isSfxActive) return;
        return _playSingleAudio(GameAssets.jumpSfx);
      case OneDungeonAudio.landing:
        if (!isSfxActive) return;
        return _playSingleAudio(GameAssets.landingSfx);
      case OneDungeonAudio.pickUp:
        if (!isSfxActive) return;
        return _playSingleAudio(GameAssets.pickUpSfx);
      case OneDungeonAudio.pickUpStar:
        if (!isSfxActive) return;
        return _playSingleAudio(GameAssets.pickUpStarSfx);
      case OneDungeonAudio.select:
        if (!isSfxActive) return;
        return _playSingleAudio(GameAssets.selectSfx);
      case OneDungeonAudio.success:
        if (!isSfxActive) return;
        return _playSingleAudio(GameAssets.successSfx);
    }
  }

  /// Stops background music.
  Future<void> stop() => _stopBackgroundAudio();
}
