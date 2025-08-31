import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_dungeon/entities/entities.dart';

class Boy extends PositionedEntity with HasGameRef {
  Boy({
    required LogicalKeyboardKey leftKey,
    required LogicalKeyboardKey rightKey,
    Vector2? center,
  }) : this._(
         center: center ?? Vector2(30, 500),
         behaviors: [
           BoyAirResistanceBehavior(),
           BoyGravityBehavior(),
           DangerCollidingBehavior(),
           ElevatorCollidingBehavior(),
           GateCollidingBehavior(),
           GroundCollidingBehavior(),
           KeyboardMovingBehavior(leftKey: leftKey, rightKey: rightKey),
           StarCollidingBehavior(),
         ],
         boySprite: BoySprite(textureSize: _boySize),
       );

  Boy._({
    required Vector2 center,
    required Iterable<Behavior> behaviors,
    required BoySprite boySprite,
    Vector2? velocity,
  }) : _boySprite = boySprite,
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

  Boy.wasd({Vector2? center})
    : this(
        center: center,
        leftKey: LogicalKeyboardKey.keyA,
        rightKey: LogicalKeyboardKey.keyD,
      );

  Boy.arrows({Vector2? center})
    : this(
        center: center,
        leftKey: LogicalKeyboardKey.arrowLeft,
        rightKey: LogicalKeyboardKey.arrowRight,
      );

  @visibleForTesting
  Boy.test({Vector2? velocity, Vector2? center, Behavior? behavior})
    : this._(
        velocity: velocity,
        center: center ?? Vector2(30, 500),
        behaviors: [if (behavior != null) behavior],
        boySprite: BoySprite(textureSize: _boySize)..size = _boySize / 2,
      );

  final BoySprite _boySprite;
  final Vector2 velocity;
  bool isBottomTouching = false;
  bool isTopTouching = false;
  bool isLeftSideTouching = false;
  bool isRightSideTouching = false;
  bool isFlipped = false;
  bool isWalking = false;
  bool isUsingElevator = false;

  void jump() => findBehavior<KeyboardMovingBehavior>().jump();

  void updateState({required BoyState state}) =>
      _boySprite.updateState(state: state);

  static final _boySize = Vector2(64, 64);
}
