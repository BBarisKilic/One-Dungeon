import 'package:flame/game.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

void main() {
  TestWidgetsBinding.ensureInitialized();

  late StarCollidingBehavior starCollidingBehavior;

  setUp(() {
    starCollidingBehavior = StarCollidingBehavior();
  });

  setUpAll(() async {
    await injectDependencies();
    await getIt.unregister<OneDungeonAudioPlayer>();
    getIt.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await getIt.reset();
  });

  group('StarCollidingBehavior', () {
    testWithGame<TestGame>(
      'collected stars increases when touches',
      TestGame.new,
      (game) async {
        final star = Star(center: Vector2(10, 10));
        final boy = Boy.test(
          velocity: Vector2(10, 10),
          behavior: starCollidingBehavior,
        );

        game.overlays.addEntry(
          OneDungeonGame.gameOverMenuOverlay,
          (context, game) => const SizedBox(),
        );

        await game.ready();

        await game.world.ensureAdd(star);
        await game.world.ensureAdd(boy);

        final collectedStars = game.collectedStars;

        await starCollidingBehavior
            .onCollisionStart({Vector2(0, 0), Vector2(10, 0)}, star);

        expect(game.collectedStars, equals(collectedStars + 1));
      },
    );

    testWithGame<TestGame>(
      'stars get removed from the component tree when touches',
      TestGame.new,
      (game) async {
        final star = Star(center: Vector2(10, 10));
        final boy = Boy.test(
          velocity: Vector2(10, 10),
          behavior: starCollidingBehavior,
        );

        game.overlays.addEntry(
          OneDungeonGame.gameOverMenuOverlay,
          (context, game) => const SizedBox(),
        );

        await game.ready();

        await game.world.ensureAdd(star);
        await game.world.ensureAdd(boy);

        expect(game.world.children.contains(star), isTrue);

        await starCollidingBehavior
            .onCollisionStart({Vector2(0, 0), Vector2(10, 0)}, star);
        game.update(1);

        expect(game.world.children.contains(star), isFalse);
      },
    );
  });
}
