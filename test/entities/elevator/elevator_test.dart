import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsBinding.ensureInitialized();

  setUpAll(() async {
    await injectDependencies();
    await getIt.unregister<OneDungeonAudioPlayer>();
    getIt.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await getIt.reset();
  });

  group('Elevator', () {
    testWithGame<TestGame>(
      'loads correctly',
      TestGame.new,
      (game) async {
        final elevator = ElevatorEntity.test();

        await game.ready();

        await game.world.ensureAdd(elevator);

        expect(game.world.contains(elevator), isTrue);
      },
    );

    testWithGame<TestGame>(
      'positioned correctly',
      TestGame.new,
      (game) async {
        final elevator = ElevatorEntity.test(center: Vector2.zero());

        await game.ready();

        await game.world.ensureAdd(elevator);

        expect(elevator.position, closeToVector(Vector2(0, 0)));
      },
    );
  });
}
