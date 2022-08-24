import 'package:flame/extensions.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/game/game.dart';

extension OneDungeonGameX on OneDungeonGame {
  List<Future<Image> Function()> preLoadAssets() {
    return [
      () => images.load(GameAssets.kBoyIdleSprite),
      () => images.load(GameAssets.kBoyRunSprite),
      () => images.load(GameAssets.kBoyJumpSprite),
      () => images.load(GameAssets.kStarSprite),
      () => images.load(GameAssets.kElevatorImage),
    ];
  }
}
