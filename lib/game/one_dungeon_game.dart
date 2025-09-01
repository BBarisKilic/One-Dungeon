import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/l10n/l10n.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

/// Helps to define current [GameStatus]
enum GameStatus {
  /// Game is won.
  win,

  /// Game is lost.
  lose,
}

class OneDungeonGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection, TapCallbacks {
  OneDungeonGame()
      : time = 0,
        score = 0,
        collectedStars = 0,
        focusNode = FocusNode(),
        world = World(),
        super();

  /// Instance of [World].
  @override
  final World world;

  /// Instance of [FocusNode].
  final FocusNode focusNode;

  late Boy boy;

  /// Instance of [CameraComponent].
  late final CameraComponent cameraComponent;

  /// Instance of [OneDungeonAudioPlayer].
  late final OneDungeonAudioPlayer audioPlayer;

  /// Instance of [AppLocalizations].
  AppLocalizations? l10n;

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
    audioPlayer = getIt<OneDungeonAudioPlayer>();

    await FlameAudio.bgm.initialize();

    final map = await _createMap();
    await _createCameraAndWorld(map: map);
    await _createEntities();

    pauseEngine();

    return super.onLoad();
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    super.onKeyEvent(event, keysPressed);

    return KeyEventResult.handled;
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    // If game is paused, do nothing.
    if (super.paused) return;

    boy.jump();
  }

  Future<TiledComponent> _createMap() async {
    final map = await TiledComponent.load(GameMaps.kLeveOne, Vector2.all(16));

    await Future.wait([
      Future.value(world.add(map)),
      _addGrounds(map),
      _addGates(map),
      _addTraps(map),
    ]);

    return map;
  }

  Future<void> _createCameraAndWorld({required TiledComponent map}) async {
    cameraComponent = CameraComponent.withFixedResolution(
      world: world,
      width: map.width,
      height: map.height,
    )..viewfinder.anchor = map.anchor;

    await addAll([cameraComponent, world]);
  }

  Future<void> _addGrounds(TiledComponent map) async {
    final obstacleGroup = map.tileMap.getLayer<ObjectGroup>(
      GameMapLayers.kGroundLayer,
    );
    if (obstacleGroup == null) return;

    final loadables = <Future<void>>[];
    for (final tiledObject in obstacleGroup.objects) {
      loadables.add(
        Future.value(
          world.add(
            Ground(
              size: Vector2(tiledObject.width, tiledObject.height),
              position: Vector2(tiledObject.x, tiledObject.y),
            ),
          ),
        ),
      );
    }

    await Future.wait(loadables);
  }

  Future<void> _addGates(TiledComponent map) async {
    final obstacleGroup = map.tileMap.getLayer<ObjectGroup>(
      GameMapLayers.kGateLayer,
    );
    if (obstacleGroup == null) return;

    final loadables = <Future<void>>[];
    for (final tiledObject in obstacleGroup.objects) {
      loadables.add(
        Future.value(
          world.add(
            Gate(
              size: Vector2(tiledObject.width, tiledObject.height),
              position: Vector2(tiledObject.x, tiledObject.y),
            ),
          ),
        ),
      );
    }

    await Future.wait(loadables);
  }

  Future<void> _addTraps(TiledComponent map) async {
    final obstacleGroup = map.tileMap.getLayer<ObjectGroup>(
      GameMapLayers.kTrapLayer,
    );
    if (obstacleGroup == null) return;

    final loadables = <Future<void>>[];
    for (final tiledObject in obstacleGroup.objects) {
      loadables.add(
        Future.value(
          world.add(
            Trap(
              size: Vector2(tiledObject.width, tiledObject.height),
              position: Vector2(tiledObject.x, tiledObject.y),
            ),
          ),
        ),
      );
    }

    await Future.wait(loadables);
  }

  Future<void> _createEntities() async {
    boy = Boy.wasd();

    final loadables = [
      _addStars(),
      Future.value(world.add(GameTime())),
      Future.value(world.add(Elevator())),
      Future.value(world.add(boy)),
    ];

    await Future.wait(loadables);
  }

  Future<void> _addStars() async {
    await Future.wait(loadStars(world));
  }

  FutureOr<void> startGame() {
    if (time != 0) return restartGame();

    overlays.clear();
    unawaited(audioPlayer.play(OneDungeonAudio.backgroundMusic));
    resumeEngine();
  }

  Future<void> restartGame() async {
    score = 0;
    collectedStars = 0;
    time = 0;

    overlays.clear();

    // Remove all children from the world.
    world.removeAll(world.children);

    // Read all children to the world.
    await _createMap();
    await _createEntities();

    await audioPlayer.play(OneDungeonAudio.backgroundMusic);

    resumeEngine();
  }

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
