import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

/// {@template boy_gate_collision_behavior}
/// A behavior that handles collision between boy and gate entities.
/// {@endtemplate}
class BoyGateCollisionBehavior extends CollisionBehavior<Gate, Boy>
    with HasGameReference<OneDungeonGame> {
  /// {@macro boy_gate_collision_behavior}
  BoyGateCollisionBehavior();

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, Gate other) {
    super.game.stopGame(GameStatus.win);
    super.onCollisionStart(intersectionPoints, other);
  }
}
