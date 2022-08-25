import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

class GateCollidingBehavior extends CollisionBehavior<Gate, Boy>
    with HasGameRef<OneDungeonGame> {
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, Gate other) {
    gameRef.stopGame(GameStatus.win);

    super.onCollisionStart(intersectionPoints, other);
  }
}
