import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:one_dungeon/constants/constants.dart';

/// {@template elevator_sprite}
/// Sprite of the elevator entity.
/// {@endtemplate}
class ElevatorSprite extends SpriteComponent {
  /// {@macro elevator_sprite}
  ElevatorSprite({required super.size});

  @override
  FutureOr<void>? onLoad() {
    sprite = Sprite(Flame.images.fromCache(GameAssets.elevatorImage));
    return super.onLoad();
  }
}
