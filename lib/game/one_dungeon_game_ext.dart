import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

extension OneDungeonGameExt on OneDungeonGame {
  List<Future<Image> Function()> preLoadAssets() {
    return [
      () async => images.load(GameAssets.boyIdleSprite),
      () async => images.load(GameAssets.boyRunSprite),
      () async => images.load(GameAssets.boyJumpSprite),
      () async => images.load(GameAssets.elevatorImage),
      () async => images.load(GameAssets.starSprite),
    ];
  }

  List<Future<void>> loadStars(World world) {
    return [
      Future.value(world.add(StarEntity(center: Vector2(350, 470)))),
      Future.value(world.add(StarEntity(center: Vector2(665, 470)))),
      Future.value(world.add(StarEntity(center: Vector2(805, 440)))),
      Future.value(world.add(StarEntity(center: Vector2(950, 395)))),
      Future.value(world.add(StarEntity(center: Vector2(1095, 380)))),
      Future.value(world.add(StarEntity(center: Vector2(1260, 270)))),
      Future.value(world.add(StarEntity(center: Vector2(1260, 110)))),
      Future.value(world.add(StarEntity(center: Vector2(330, 130)))),
      Future.value(world.add(StarEntity(center: Vector2(380, 140)))),
      Future.value(world.add(StarEntity(center: Vector2(430, 150)))),
      Future.value(world.add(StarEntity(center: Vector2(480, 160)))),
      Future.value(world.add(StarEntity(center: Vector2(530, 150)))),
      Future.value(world.add(StarEntity(center: Vector2(580, 140)))),
      Future.value(world.add(StarEntity(center: Vector2(630, 130)))),
      Future.value(world.add(StarEntity(center: Vector2(680, 140)))),
      Future.value(world.add(StarEntity(center: Vector2(730, 150)))),
      Future.value(world.add(StarEntity(center: Vector2(780, 160)))),
      Future.value(world.add(StarEntity(center: Vector2(830, 170)))),
      Future.value(world.add(StarEntity(center: Vector2(880, 160)))),
      Future.value(world.add(StarEntity(center: Vector2(930, 150)))),
      Future.value(world.add(StarEntity(center: Vector2(40, 120)))),
      Future.value(world.add(StarEntity(center: Vector2(184, 150)))),
      Future.value(world.add(StarEntity(center: Vector2(40, 240)))),
      Future.value(world.add(StarEntity(center: Vector2(150, 355)))),
    ];
  }
}
