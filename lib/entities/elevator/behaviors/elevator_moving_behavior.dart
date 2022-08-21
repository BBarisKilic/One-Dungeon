import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/entities/entities.dart';

class ElevatorMovingBehavior extends Behavior<Elevator> {
  final _elevatorSpeed = 40;
  bool isGoingDown = true;

  @override
  void update(double dt) {
    if (parent.position.y < 340 && isGoingDown) {
      parent.position.y += _elevatorSpeed * dt;
    } else {
      isGoingDown = false;
    }

    if (parent.position.y > 170 && !isGoingDown) {
      parent.position.y -= _elevatorSpeed * dt;
    } else {
      isGoingDown = true;
    }

    super.update(dt);
  }
}
