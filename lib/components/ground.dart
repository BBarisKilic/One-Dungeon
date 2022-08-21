import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Ground extends PositionComponent {
  Ground({
    required Vector2 size,
    required Vector2 position,
  }) : super(
          size: size,
          position: position,
        );

  @override
  Future<void>? onLoad() async {
    await add(RectangleHitbox());
    return super.onLoad();
  }
}
