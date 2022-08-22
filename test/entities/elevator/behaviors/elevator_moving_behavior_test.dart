// ignore_for_file: cascade_invocations

import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;

import '../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ElevatorMovingBehavior elevatorMovingBehavior;

  setUp(() {
    elevatorMovingBehavior = ElevatorMovingBehavior();
  });

  setUpAll(() async {
    await di.initializeDependencies();
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('ElevatorMovingBehavior', () {
    final flameTester = FlameTester<TestGame>(TestGame.new);

    flameTester.test('going up as expected', (game) async {
      final center = Vector2(0, 350);
      final elevator = Elevator.test(
        center: center,
        behavior: elevatorMovingBehavior,
      );

      await game.ready();
      await game.ensureAdd(elevator);

      elevatorMovingBehavior.isGoingDown = true;

      game.update(1);

      expect(elevatorMovingBehavior.isGoingDown, isFalse);
    });

    flameTester.test('going up as expected', (game) async {
      final center = Vector2(0, 350);
      final elevator = Elevator.test(
        center: center,
        behavior: elevatorMovingBehavior,
      );

      await game.ready();
      await game.ensureAdd(elevator);

      elevatorMovingBehavior.isGoingDown = true;

      game.update(1);

      expect(elevatorMovingBehavior.isGoingDown, isFalse);
    });

    flameTester.test('going down as expected', (game) async {
      final center = Vector2(0, 160);
      final elevator = Elevator.test(
        center: center,
        behavior: elevatorMovingBehavior,
      );

      await game.ready();
      await game.ensureAdd(elevator);

      elevatorMovingBehavior.isGoingDown = false;

      game.update(1);

      expect(elevatorMovingBehavior.isGoingDown, isTrue);
    });
  });
}
