import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

/// {@template boy_air_resistance_behavior}
/// A behavior that applies air resistance to boy entity.
/// {@endtemplate}
class BoyAirResistanceBehavior extends Behavior<Boy>
    with HasGameReference<OneDungeonGame> {
  /// {@macro boy_air_resistance_behavior}
  BoyAirResistanceBehavior();

  @override
  void update(double dt) {
    _applyAirResistance(dt);
    _setPositionX(dt);

    super.update(dt);
  }

  void _applyAirResistance(double dt) {
    if (parent.isWalking) return;

    if (parent.velocity.x > 0) {
      parent.velocity.x -= GameWorld.airResistance * dt;

      if (parent.velocity.x <= 1) parent.velocity.x = 0;
    }

    if (parent.velocity.x < 0) {
      parent.velocity.x += GameWorld.airResistance * dt;

      if (parent.velocity.x >= -1) parent.velocity.x = 0;
    }
  }

  void _setPositionX(double dt) {
    if (parent.position.x < parent.size.x / 2) {
      parent.velocity.x = 0;
      parent.position.x = parent.size.x / 2;
    } else if (parent.position.x >
        super.game.cameraComponent.visibleWorldRect.width - parent.size.x / 2) {
      parent.velocity.x = 0;
      parent.position.x =
          super.game.cameraComponent.visibleWorldRect.width - parent.size.x / 2;
    } else {
      parent.position.x += parent.velocity.x * dt;
    }
  }
}
