import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

class BoyGateCollisionBehavior extends CollisionBehavior<Gate, Boy>
    with HasGameReference<OneDungeonGame> {
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, Gate other) {
    super.game.stopGame(GameStatus.win);
    super.onCollisionStart(intersectionPoints, other);
  }
}
