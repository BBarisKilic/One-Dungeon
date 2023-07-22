// ignore_for_file: cascade_invocations

import 'package:flame/game.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;

import '../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ElevatorCollidingBehavior elevatorCollidingBehavior;

  setUp(() {
    elevatorCollidingBehavior = ElevatorCollidingBehavior();
  });

  setUpAll(() async {
    await di.initializeDependencies();
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('ElevatorCollidingBehavior', () {
    testWithGame<TestGame>(
      'detects when bottom touches',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          center: Vector2(0, 0),
          behavior: elevatorCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);
        boy.isBottomTouching = false;

        elevatorCollidingBehavior
            .onCollision({Vector2(0, 0), Vector2(10, 10)}, Elevator());

        expect(boy.isBottomTouching, isTrue);
      },
    );

    testWithGame<TestGame>(
      'detects when top touches',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          center: Vector2(0, 200),
          behavior: elevatorCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.isTopTouching, isFalse);

        elevatorCollidingBehavior
            .onCollision({Vector2(0, 0), Vector2(10, 0)}, Elevator());

        expect(boy.isTopTouching, isTrue);
      },
    );

    testWithGame<TestGame>(
      'detects when side(left) touches',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          center: Vector2(10, 0),
          behavior: elevatorCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.isLeftSideTouching, isFalse);
        expect(boy.isRightSideTouching, isFalse);

        boy.isFlipped = true;
        elevatorCollidingBehavior
            .onCollision({Vector2(8, 0), Vector2(9, 10)}, Elevator());

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
          behavior: elevatorCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.isLeftSideTouching, isFalse);
        expect(boy.isRightSideTouching, isFalse);

        boy.isFlipped = false;
        elevatorCollidingBehavior
            .onCollision({Vector2(11, 0), Vector2(12, 10)}, Elevator());

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
          behavior: elevatorCollidingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        expect(boy.isBottomTouching, isFalse);

        elevatorCollidingBehavior
            .onCollision({Vector2(10, 20), Vector2(40, 20)}, Elevator());

        expect(boy.isBottomTouching, isTrue);

        elevatorCollidingBehavior.onCollisionEnd(Elevator());

        expect(boy.isBottomTouching, isFalse);
      },
    );
  });
}
