import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

/// {@template gate}
/// A gate that the player can pass through.
/// {@endtemplate}
class Gate extends PositionComponent {
  /// {@macro gate}
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
