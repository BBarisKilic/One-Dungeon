import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:one_dungeon/constants/constants.dart';

class ElevatorSprite extends SpriteComponent {
  ElevatorSprite({required super.size});

  @override
  Future<void>? onLoad() {
    sprite = Sprite(Flame.images.fromCache(GameAssets.kElevatorImage));
    return super.onLoad();
  }
}
