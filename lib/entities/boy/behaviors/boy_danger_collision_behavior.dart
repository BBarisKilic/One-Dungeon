import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

/// {@template boy_danger_collision_behavior}
/// A behavior that handles collision between boy and danger entities.
/// {@endtemplate}
class BoyDangerCollisionBehavior extends CollisionBehavior<Danger, BoyEntity>
    with HasGameReference<OneDungeonGame> {
  /// {@macro boy_danger_collision_behavior}
  BoyDangerCollisionBehavior();

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, Danger other) {
    parent.velocity.x = 0;
    parent.velocity.y = -100;

    super.game.stopGame(GameStatus.lose);

    super.onCollisionStart(intersectionPoints, other);
  }
}
