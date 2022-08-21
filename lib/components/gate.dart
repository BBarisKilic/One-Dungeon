import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Gate extends PositionComponent {
  Gate({
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
