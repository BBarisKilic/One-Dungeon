// ignore_for_file: cascade_invocations

import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

void main() {
  TestWidgetsBinding.ensureInitialized();

  late BoyAirResistanceBehavior boyAirResistanceBehavior;

  setUp(() {
    boyAirResistanceBehavior = BoyAirResistanceBehavior();
  });

  setUpAll(() async {
    await di.initializeDependencies();
    await di.injector.unregister<OneDungeonAudioPlayer>();
    di.injector.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('BoyAirResistanceBehavior', () {
    testWithGame<TestGame>(
      'applies resistance when having positive velocity in the x direction',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          velocity: Vector2(10, 0),
          behavior: boyAirResistanceBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.velocity.x, equals(10));

        game.update(1);

        expect(boy.velocity.x, isNot(equals(10)));
      },
    );

    testWithGame<TestGame>(
      'applies resistance when having negative velocity in the x direction',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          velocity: Vector2(-10, 0),
          behavior: boyAirResistanceBehavior,
        );

        await game.ready();
        await game.world.ensureAdd(boy);

        expect(boy.velocity.x, equals(-10));

        game.update(1);

        expect(boy.velocity.x, isNot(equals(-10)));
      },
    );

    testWithGame<TestGame>(
      'stops character on left edge of the screen',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          velocity: Vector2(-10, 0),
          center: Vector2(10, 0),
          behavior: boyAirResistanceBehavior,
        );

        await game.ready();
        await game.world.ensureAdd(boy);

        expect(boy.position.x, equals(10));

        game.update(1);

        expect(boy.position.x, equals(boy.size.x / 2));
      },
    );

    testWithGame<TestGame>(
      'stops character on right edge of the screen',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          velocity: Vector2(10, 0),
          center: Vector2(game.cameraComponent.visibleWorldRect.width, 0),
          behavior: boyAirResistanceBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(
          boy.position.x,
          equals(game.cameraComponent.visibleWorldRect.width),
        );

        game.update(1);

        expect(
          boy.position.x,
          equals(
            game.cameraComponent.visibleWorldRect.width - (boy.size.x / 2),
          ),
        );
      },
    );
  });
}
