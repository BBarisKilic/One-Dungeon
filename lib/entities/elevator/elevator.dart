import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:one_dungeon/entities/entities.dart';

class Elevator extends PositionedEntity {
  Elevator({
    Vector2? center,
  }) : this._(
          center: center ?? Vector2(1110, 200),
          spriteComponent: ElevatorSprite(size: _elevatorSize),
          behaviors: [ElevatorMovingBehavior()],
        );

  Elevator._({
    required Vector2 center,
    required this.spriteComponent,
    required Iterable<Behavior> behaviors,
  }) : super(
          size: _elevatorSize,
          position: center,
          anchor: Anchor.topCenter,
          behaviors: [
            PropagatingCollisionBehavior(RectangleHitbox()),
            ...behaviors,
          ],
          children: [spriteComponent],
        );

  @visibleForTesting
  Elevator.test({
    Vector2? center,
    Behavior? behavior,
  }) : this._(
          center: center ?? Vector2(1110, 200),
          spriteComponent: ElevatorSprite(size: _elevatorSize),
          behaviors: [if (behavior != null) behavior],
        );

  final SpriteComponent spriteComponent;

  static final _elevatorSize = Vector2(103, 9);
}
