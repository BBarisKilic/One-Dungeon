import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

void main() {
  TestWidgetsBinding.ensureInitialized();

  late ElevatorMovementBehavior elevatorMovingBehavior;

  setUp(() {
    elevatorMovingBehavior = ElevatorMovementBehavior();
  });

  setUpAll(() async {
    await injectDependencies();
    await getIt.unregister<OneDungeonAudioPlayer>();
    getIt.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await getIt.reset();
  });

  group('ElevatorMovingBehavior', () {
    testWithGame<TestGame>(
      'going up as expected',
      TestGame.new,
      (game) async {
        final center = Vector2(0, 350);
        final elevator = ElevatorEntity.test(
          center: center,
          behavior: elevatorMovingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(elevator);

        elevatorMovingBehavior.isGoingDown = true;

        game.update(1);

        expect(elevatorMovingBehavior.isGoingDown, isFalse);
      },
    );

    testWithGame<TestGame>(
      'going down as expected',
      TestGame.new,
      (game) async {
        final center = Vector2(0, 160);
        final elevator = ElevatorEntity.test(
          center: center,
          behavior: elevatorMovingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(elevator);

        elevatorMovingBehavior.isGoingDown = false;

        game.update(1);

        expect(elevatorMovingBehavior.isGoingDown, isTrue);
      },
    );
  });
}
