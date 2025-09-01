import 'package:flame/game.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

class _MockGate extends Mock implements Gate {}

void main() {
  TestWidgetsBinding.ensureInitialized();

  late GateCollidingBehavior gateCollidingBehavior;

  setUp(() {
    gateCollidingBehavior = GateCollidingBehavior();
  });

  setUpAll(() async {
    await injectDependencies();
    await getIt.unregister<OneDungeonAudioPlayer>();
    getIt.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await getIt.reset();
  });

  group('GateCollidingBehavior', () {
    testWithGame<TestGame>(
      'detects when touches',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          velocity: Vector2(10, 10),
          behavior: gateCollidingBehavior,
        );

        game.overlays.addEntry(
          OneDungeonGame.gameOverMenuOverlay,
          (context, game) => const SizedBox(),
        );
        await game.ready();

        await game.world.ensureAdd(boy);

        gateCollidingBehavior
            .onCollisionStart({Vector2(0, 0), Vector2(10, 0)}, _MockGate());

        expect(boy.velocity.y, equals(10));
      },
    );
  });
}
