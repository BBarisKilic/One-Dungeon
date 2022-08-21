import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/entities/elevator/behaviors/elevator_moving_behavior.dart';

class Elevator extends Entity {
  Elevator({
    Vector2? center,
  }) : this._(
          center: center ?? Vector2(1110, 200),
          spriteComponent: SpriteComponent(
            size: _elevatorSize,
            sprite: Sprite(Flame.images.fromCache(GameAssets.kElevatorImage)),
          )..size = _elevatorSize,
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

  final SpriteComponent spriteComponent;

  static final _elevatorSize = Vector2(103, 9);
}
