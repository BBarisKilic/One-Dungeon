import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/services.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

class KeyboardMovingBehavior extends Behavior<Boy>
    with KeyboardHandler, HasGameRef<OneDungeonGame> {
  KeyboardMovingBehavior({
    required this.jumpKey,
    required this.leftKey,
    required this.rightKey,
  });

  final LogicalKeyboardKey jumpKey;
  final LogicalKeyboardKey leftKey;
  final LogicalKeyboardKey rightKey;

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _setVelocityX(keysPressed);
    _setVelocityY(keysPressed);

    return super.onKeyEvent(event, keysPressed);
  }

  void _setVelocityX(Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(leftKey) &&
        !parent.isLeftSideTouching &&
        parent.position.x > parent.size.x / 2) {
      parent.isWalking = true;
      parent.velocity.x = -100;
    } else if (keysPressed.contains(rightKey) &&
        !parent.isRightSideTouching &&
        parent.position.x < gameRef.size[0] - parent.size.x / 2) {
      parent.isWalking = true;
      parent.velocity.x = 100;
    } else {
      parent.isWalking = false;
    }
  }

  void _setVelocityY(Set<LogicalKeyboardKey> keysPressed) {
    if (!keysPressed.contains(jumpKey)) return;
    if (parent.velocity.y != 0) return;
    if (parent.isTopTouching) return;

    if (parent.isUsingElevator) {
      parent.position.y -= 5;
    }
    parent.velocity.y -= 110;
  }

  @override
  void update(double dt) {
    _updateBoyDirection();
    _updateBoyState();

    super.update(dt);
  }

  void _updateBoyDirection() {
    if (parent.velocity.x > 0 && parent.isFlipped) {
      parent
        ..isFlipped = false
        ..flipHorizontallyAroundCenter();
    }

    if (parent.velocity.x < 0 && !parent.isFlipped) {
      parent
        ..isFlipped = true
        ..flipHorizontallyAroundCenter();
    }
  }

  void _updateBoyState() {
    if (parent.velocity.y != 0) {
      parent.updateState(state: const BoyState.jump());
    } else if (parent.velocity.x != 0) {
      parent.updateState(state: const BoyState.run());
    } else {
      parent.updateState(state: const BoyState.idle());
    }
  }
}
