import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

class StarCollidingBehavior extends CollisionBehavior<Star, Boy>
    with HasGameRef<OneDungeonGame> {
  @override
  Future<void> onCollisionStart(
    Set<Vector2> intersectionPoints,
    Star other,
  ) async {
    gameRef.remove(other);
    gameRef.collectedStars++;
    await gameRef.audioPlayer.play(OneDungeonAudio.pickUpStar);

    super.onCollisionStart(intersectionPoints, other);
  }
}
