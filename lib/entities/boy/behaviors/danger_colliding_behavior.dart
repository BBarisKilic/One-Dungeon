import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

class DangerCollidingBehavior extends CollisionBehavior<Danger, Boy>
    with HasGameRef<OneDungeonGame> {
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, Danger other) {
    parent.velocity.x = 0;
    parent.velocity.y = -100;

    gameRef.stopGame(GameStatus.lose);

    super.onCollisionStart(intersectionPoints, other);
  }
}
