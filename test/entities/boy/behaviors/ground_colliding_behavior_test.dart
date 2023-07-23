// ignore_for_file: cascade_invocations

import 'package:flame/game.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

class _MockGround extends Mock implements Ground {}

void main() {
  TestWidgetsBinding.ensureInitialized();

  late GroundCollidingBehavior groundCollidingBehavior;

  setUp(() {
    groundCollidingBehavior = GroundCollidingBehavior();
  });

  setUpAll(() async {
    await di.initializeDependencies();
    await di.injector.unregister<OneDungeonAudioPlayer>();
    di.injector.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('GroundCollidingBehavior', () {
    testWithGame<TestGame>(
      'detects when bottom touches',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          center: Vector2(0, 0),
          behavior: groundCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);
        boy.isBottomTouching = false;

        groundCollidingBehavior
            .onCollision({Vector2(0, 0), Vector2(10, 10)}, _MockGround());

        expect(boy.isBottomTouching, isTrue);
      },
    );

    testWithGame<TestGame>(
      'detects when top touches',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          center: Vector2(0, 200),
          behavior: groundCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.isTopTouching, isFalse);

        groundCollidingBehavior
            .onCollision({Vector2(0, 0), Vector2(10, 0)}, _MockGround());

        expect(boy.isTopTouching, isTrue);
      },
    );

    testWithGame<TestGame>(
      'detects when side(left) touches',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          center: Vector2(10, 0),
          behavior: groundCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.isLeftSideTouching, isFalse);
        expect(boy.isRightSideTouching, isFalse);

        boy.isFlipped = true;
        groundCollidingBehavior
            .onCollision({Vector2(8, 0), Vector2(9, 10)}, _MockGround());

        expect(boy.isLeftSideTouching, isTrue);
        expect(boy.isRightSideTouching, isFalse);
      },
    );

    testWithGame<TestGame>(
      'detects when side(right) touches',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          center: Vector2(10, 0),
          behavior: groundCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.isLeftSideTouching, isFalse);
        expect(boy.isRightSideTouching, isFalse);

        boy.isFlipped = false;
        groundCollidingBehavior
            .onCollision({Vector2(11, 0), Vector2(12, 10)}, _MockGround());

        expect(boy.isLeftSideTouching, isFalse);
        expect(boy.isRightSideTouching, isTrue);
      },
    );

    testWithGame<TestGame>(
      'bottom is not touching when the collision end',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          velocity: Vector2(0, 10),
          center: Vector2(10, 20),
          behavior: groundCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.isBottomTouching, isFalse);

        groundCollidingBehavior
            .onCollision({Vector2(10, 20), Vector2(40, 20)}, _MockGround());

        expect(boy.isBottomTouching, isTrue);

        groundCollidingBehavior.onCollisionEnd(_MockGround());

        expect(boy.isBottomTouching, isFalse);
      },
    );
  });
}
