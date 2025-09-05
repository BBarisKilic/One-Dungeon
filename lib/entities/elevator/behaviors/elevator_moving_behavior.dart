import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/entities/entities.dart';

/// {@template elevator_movement_behavior}
/// A behavior that handles the vertical movement of the elevator entity.
/// The elevator moves up and down between two defined points.
/// {@endtemplate}
class ElevatorMovementBehavior extends Behavior<ElevatorEntity> {
  /// {@macro elevator_movement_behavior}
  ElevatorMovementBehavior();

  final _elevatorSpeed = 40;

  /// Indicates whether the elevator is currently moving downwards.
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
