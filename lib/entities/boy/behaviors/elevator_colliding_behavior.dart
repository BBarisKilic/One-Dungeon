import 'package:flame/extensions.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/entities/entities.dart';

class ElevatorCollidingBehavior extends CollisionBehavior<Elevator, Boy> {
  @override
  void onCollision(Set<Vector2> intersectionPoints, Elevator other) {
    final pointOne = intersectionPoints.first;
    final pointTwo = intersectionPoints.last;

    if ((pointOne.x - pointTwo.x).abs() < 2) {
      _onSideCollision(pointOne.x, pointTwo.x);
    } else {
      if ((parent.position.y - pointOne.y).abs() < parent.size.y / 2) {
        _onBottomCollision(other);
      } else {
        _onTopCollision();
      }
    }

    super.onCollision(intersectionPoints, other);
  }

  void _onSideCollision(double x1, double x2) {
    if (!parent.isFlipped && parent.position.x < x1) {
      parent
        ..velocity.x = 0
        ..isRightSideTouching = true;
    }

    if (parent.isFlipped && parent.position.x > x1) {
      parent
        ..velocity.x = 0
        ..isLeftSideTouching = true;
    }
  }

  void _onBottomCollision(Elevator other) {
    parent.velocity.y = 0;
    parent.position.y = other.position.y + 4;
    parent
      ..isUsingElevator = true
      ..isBottomTouching = true;
  }

  void _onTopCollision() {
    parent.velocity.y = 100;
    parent.isTopTouching = true;
  }

  @override
  void onCollisionEnd(Elevator other) {
    parent
      ..isBottomTouching = false
      ..isTopTouching = false
      ..isLeftSideTouching = false
      ..isRightSideTouching = false
      ..isUsingElevator = false;

    super.onCollisionEnd(other);
  }
}
