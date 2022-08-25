import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/entities/entities.dart';

class Star extends Entity {
  Star({
    required Vector2 center,
  }) : this._(
          center: center,
          behaviors: [],
          starSprite: StarSprite(textureSize: _starSize),
        );

  Star._({
    required Vector2 center,
    required Iterable<Behavior> behaviors,
    required StarSprite starSprite,
  }) : super(
          size: _starSize,
          position: center,
          anchor: Anchor.bottomCenter,
          behaviors: [
            PropagatingCollisionBehavior(RectangleHitbox()),
            ...behaviors,
          ],
          children: [
            starSprite,
          ],
        );

  static final _starSize = Vector2(20, 18);
}
