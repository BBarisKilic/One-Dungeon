import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/entities/entities.dart';

class BoyGravityBehavior extends Behavior<Boy> {
  @override
  void update(double dt) {
    _applyGravity(dt);
    _setPositionY(dt);

    super.update(dt);
  }

  void _applyGravity(double dt) {
    if (parent.velocity.y > 0 || !parent.isBottomTouching) {
      parent.velocity.y += GameWorld.kGravity * dt;
    }
  }

  void _setPositionY(double dt) {
    parent.position.y += parent.velocity.y * dt;
  }
}
