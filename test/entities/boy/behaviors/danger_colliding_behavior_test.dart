// ignore_for_file: cascade_invocations

import 'package:flame/game.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

class _MockDanger extends Mock implements Danger {}

void main() {
  TestWidgetsBinding.ensureInitialized();

  late DangerCollidingBehavior dangerCollidingBehavior;

  setUp(() {
    dangerCollidingBehavior = DangerCollidingBehavior();
  });

  setUpAll(() async {
    await di.initializeDependencies();
    await di.injector.unregister<OneDungeonAudioPlayer>();
    di.injector.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('DangerCollidingBehavior', () {
    testWithGame<TestGame>(
      'detects when touches',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          center: Vector2(100, 200),
          velocity: Vector2(10, 20),
          behavior: dangerCollidingBehavior,
        );

        game.overlays.addEntry(
          OneDungeonGame.gameOverMenuOverlay,
          (context, game) => const SizedBox(),
        );
        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.velocity.x, equals(10));
        expect(boy.velocity.y, equals(20));

        dangerCollidingBehavior
            .onCollisionStart({Vector2(0, 0), Vector2(10, 0)}, _MockDanger());

        expect(boy.velocity.x, equals(0));
        expect(boy.velocity.y, equals(-100));
      },
    );
  });
}
