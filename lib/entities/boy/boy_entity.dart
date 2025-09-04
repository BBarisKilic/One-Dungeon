import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

/// {@template boy}
/// The main character controlled by the player.
/// {@endtemplate}
class Boy extends PositionedEntity with HasGameReference<OneDungeonGame> {
  /// {@macro boy}
  Boy({
    required LogicalKeyboardKey leftKey,
    required LogicalKeyboardKey rightKey,
    Vector2? center,
  }) : this._(
          center: center ?? Vector2(30, 500),
          behaviors: [
            BoyAirResistanceBehavior(),
            BoyGravityBehavior(),
            BoyDangerCollisionBehavior(),
            BoyElevatorCollisionBehavior(),
            BoyGateCollisionBehavior(),
            BoyGroundCollisionBehavior(),
            BoyMovementBehavior(leftKey: leftKey, rightKey: rightKey),
            BoyStarCollisionBehavior(),
          ],
          boySprite: BoySprite(textureSize: _boySize),
        );

  /// A private constructor.
  Boy._({
    required Vector2 center,
    required Iterable<Behavior> behaviors,
    required BoySprite boySprite,
    Vector2? velocity,
  })  : _boySprite = boySprite,
        velocity = velocity ?? Vector2.zero(),
        super(
          size: _boySize / 2,
          position: center,
          anchor: Anchor.bottomCenter,
          behaviors: [
            PropagatingCollisionBehavior(RectangleHitbox()),
            ...behaviors,
          ],
          children: [boySprite],
        );

  /// Creates a boy entity controlled by the 'WASD' keys.
  Boy.wasd({Vector2? center})
      : this(
          center: center,
          leftKey: LogicalKeyboardKey.keyA,
          rightKey: LogicalKeyboardKey.keyD,
        );

  /// Creates a boy entity controlled by the arrow keys.
  Boy.arrows({Vector2? center})
      : this(
          center: center,
          leftKey: LogicalKeyboardKey.arrowLeft,
          rightKey: LogicalKeyboardKey.arrowRight,
        );

  /// A constructor used for testing purposes.
  @visibleForTesting
  Boy.test({Vector2? velocity, Vector2? center, Behavior? behavior})
      : this._(
          velocity: velocity,
          center: center ?? Vector2(30, 500),
          behaviors: [if (behavior != null) behavior],
          boySprite: BoySprite(textureSize: _boySize)..size = _boySize / 2,
        );

  final BoySprite _boySprite;

  /// The current velocity of boy.
  final Vector2 velocity;

  /// Indicates whether the boy is touching the ground from the bottom.
  bool isBottomTouching = false;

  /// Indicates whether the boy is touching an obstacle from the top.
  bool isTopTouching = false;

  /// Indicates whether the boy is touching an obstacle from the left side.
  bool isLeftSideTouching = false;

  /// Indicates whether the boy is touching an obstacle from the right side.
  bool isRightSideTouching = false;

  /// Indicates whether the boy is facing left (true) or right (false).
  bool isFlipped = false;

  /// Indicates whether the boy is currently walking.
  bool isWalking = false;

  /// Indicates whether the boy is using an elevator.
  bool isUsingElevator = false;

  /// Makes jump action.
  void jump() => findBehavior<BoyMovementBehavior>().jump();

  /// Updates boy's state.
  void updateState({required BoyState state}) =>
      _boySprite.updateState(state: state);

  static final _boySize = Vector2(64, 64);
}
