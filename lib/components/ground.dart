import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

/// {@template ground}
/// A ground component that the player can walk on.
/// {@endtemplate}
class Ground extends PositionComponent {
  /// {@macro ground}
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
