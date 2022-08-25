import 'package:flame/extensions.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

extension OneDungeonGameX on OneDungeonGame {
  List<Future<Image> Function()> preLoadAssets() {
    return [
      () => images.load(GameAssets.kBoyIdleSprite),
      () => images.load(GameAssets.kBoyRunSprite),
      () => images.load(GameAssets.kBoyJumpSprite),
      () => images.load(GameAssets.kElevatorImage),
      () => images.load(GameAssets.kStarSprite),
    ];
  }

  List<Future<void> Function()> loadStars() {
    return [
      () async => add(Star(center: Vector2(350, 470))),
      () async => add(Star(center: Vector2(665, 470))),
      () async => add(Star(center: Vector2(805, 440))),
      () async => add(Star(center: Vector2(950, 395))),
      () async => add(Star(center: Vector2(1095, 380))),
      () async => add(Star(center: Vector2(1260, 270))),
      () async => add(Star(center: Vector2(1260, 110))),
      () async => add(Star(center: Vector2(330, 130))),
      () async => add(Star(center: Vector2(380, 140))),
      () async => add(Star(center: Vector2(430, 150))),
      () async => add(Star(center: Vector2(480, 160))),
      () async => add(Star(center: Vector2(530, 150))),
      () async => add(Star(center: Vector2(580, 140))),
      () async => add(Star(center: Vector2(630, 130))),
      () async => add(Star(center: Vector2(680, 140))),
      () async => add(Star(center: Vector2(730, 150))),
      () async => add(Star(center: Vector2(780, 160))),
      () async => add(Star(center: Vector2(830, 170))),
      () async => add(Star(center: Vector2(880, 160))),
      () async => add(Star(center: Vector2(930, 150))),
      () async => add(Star(center: Vector2(40, 120))),
      () async => add(Star(center: Vector2(184, 150))),
      () async => add(Star(center: Vector2(40, 240))),
      () async => add(Star(center: Vector2(150, 355))),
    ];
  }
}
