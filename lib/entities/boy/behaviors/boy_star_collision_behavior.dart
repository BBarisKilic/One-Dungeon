import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

class BoyStarCollisionBehavior extends CollisionBehavior<StarEntity, Boy>
    with HasGameReference<OneDungeonGame> {
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
