// ignore_for_file: cascade_invocations

import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsBinding.ensureInitialized();

  setUpAll(() async {
    await di.initializeDependencies();
    await di.injector.unregister<OneDungeonAudioPlayer>();
    di.injector.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('Boy', () {
    testWithGame<TestGame>(
      'loads correctly',
      TestGame.new,
      (game) async {
        final boy = Boy.wasd();

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(game.world.contains(boy), isTrue);
      },
    );

    testWithGame<TestGame>(
      'positioned correctly',
      TestGame.new,
      (game) async {
        final boy = Boy.arrows(center: Vector2.zero());

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.position, closeToVector(Vector2(0, 0)));
      },
    );
  });
}
