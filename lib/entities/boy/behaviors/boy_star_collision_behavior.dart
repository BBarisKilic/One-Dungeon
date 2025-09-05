import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

/// {@template boy_star_collision_behavior}
/// A behavior that handles collision between boy and star entities.
/// {@endtemplate}
class BoyStarCollisionBehavior extends CollisionBehavior<StarEntity, BoyEntity>
    with HasGameReference<OneDungeonGame> {
  /// {@macro boy_star_collision_behavior}
  BoyStarCollisionBehavior();

  @override
  Future<void> onCollisionStart(
    Set<Vector2> intersectionPoints,
    StarEntity other,
  ) async {
    super.game.world.remove(other);
    super.game.collectedStars++;
    await super.game.audioPlayer.play(OneDungeonAudio.pickUpStar);

    super.onCollisionStart(intersectionPoints, other);
  }
}
