import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

/// {@template danger}
/// A base class for all danger components in the game.
/// {@endtemplate}
abstract class Danger extends PositionComponent {
  /// {@macro danger}
  Danger({
    super.size,
    super.position,
  });

  @override
  Future<void>? onLoad() async {
    await add(RectangleHitbox());
    return super.onLoad();
  }
}
