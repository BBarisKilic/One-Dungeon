import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';
import 'package:tiled/tiled.dart';

/// Helps to define current [GameStatus]
enum GameStatus {
  /// Game is won.
  win,

  /// Game is lost.
  lose,
}

class OneDungeonGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  OneDungeonGame()
      : time = 0,
        score = 0,
        collectedStars = 0,
        focusNode = FocusNode(),
        super();

  /// Instance of [OneDungeonAudioPlayer].
  late final OneDungeonAudioPlayer audioPlayer;

  /// Instance of [FocusNode].
  final FocusNode focusNode;

  /// Game [score] of the player.
  int score;

  /// Total game [time].
  double time;

  /// Total number of [collectedStars].
  int collectedStars;

  final int _baseScore = 100;

  /// Identifier for the [MenuOverlay].
  static const menuOverlay = 'menu';

  /// Identifier for the [GameOverMenuOverlay].
  static const gameOverMenuOverlay = 'game_over_menu';

  @override
  Future<void>? onLoad() async {
    audioPlayer = di.injector<OneDungeonAudioPlayer>();
    FlameAudio.bgm.initialize();

    await _createWorld();
    await _createEntities();

    pauseEngine();

    return super.onLoad();
  }

  Future<void> _createWorld() async {
    final map = await TiledComponent.load(GameMaps.kLeveOne, Vector2(16, 16));
    final mapHeight = 16.0 * map.tileMap.map.height;
    final mapWidth = 16.0 * map.tileMap.map.width;

    camera.viewport = FixedResolutionViewport(Vector2(mapWidth, mapHeight));

    await add(map);
    await _addGrounds(map);
    await _addGates(map);
    await _addTraps(map);
  }

  Future<void> _addGrounds(TiledComponent map) async {
    final obstacleGroup =
        map.tileMap.getLayer<ObjectGroup>(GameMapLayers.kGroundLayer);
    if (obstacleGroup != null) {
      for (final obj in obstacleGroup.objects) {
        await add(
          Ground(
            size: Vector2(obj.width, obj.height),
            position: Vector2(obj.x, obj.y),
          ),
        );
      }
    }
  }

  Future<void> _addGates(TiledComponent map) async {
    final obstacleGroup =
        map.tileMap.getLayer<ObjectGroup>(GameMapLayers.kGateLayer);
    if (obstacleGroup != null) {
      for (final obj in obstacleGroup.objects) {
        await add(
          Gate(
            size: Vector2(obj.width, obj.height),
            position: Vector2(obj.x, obj.y),
          ),
        );
      }
    }
  }

  Future<void> _addTraps(TiledComponent map) async {
    final obstacleGroup =
        map.tileMap.getLayer<ObjectGroup>(GameMapLayers.kTrapLayer);
    if (obstacleGroup != null) {
      for (final obj in obstacleGroup.objects) {
        await add(
          Trap(
            size: Vector2(obj.width, obj.height),
            position: Vector2(obj.x, obj.y),
          ),
        );
      }
    }
  }

  Future<void> _createEntities() async {
    await _addStars();
    await add(GameTime());
    await add(Elevator());
    await add(Boy.wasd());
  }

  Future<void> _addStars() async {
    await Future.wait<void>(
      loadStars().map((loadableBuilder) => loadableBuilder()).toList(),
    );
  }

  @override
  @mustCallSuper
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    super.onKeyEvent(event, keysPressed);

    return KeyEventResult.handled;
  }

  Future<void> startGame() async {
    if (time != 0) return restartGame();

    overlays.clear();
    await audioPlayer.play(OneDungeonAudio.backgroundMusic);
    resumeEngine();
  }

  Future<void> restartGame() async {
    score = 0;
    collectedStars = 0;
    time = 0;

    overlays.clear();

    _removeEntities();
    await _createEntities();

    await audioPlayer.play(OneDungeonAudio.backgroundMusic);
    resumeEngine();
  }

  void _removeEntities() => children.whereType<Entity>().forEach(remove);

  Future<void> stopGame(GameStatus status) async {
    score = status == GameStatus.win ? _calculateScore() : 0;

    await audioPlayer.stop();
    await audioPlayer.play(
      status == GameStatus.win
          ? OneDungeonAudio.success
          : OneDungeonAudio.descending,
    );

    await Future<void>.delayed(const Duration(milliseconds: 333));

    overlays.add(OneDungeonGame.gameOverMenuOverlay);

    pauseEngine();
  }

  int _calculateScore() {
    final timeScore = ((60 - time) > 0 ? (60 - time) * 10 : 0).toInt();
    return _baseScore + (collectedStars * 10) + timeScore;
  }
}
