// ignore_for_file: cascade_invocations

import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await di.initializeDependencies();
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('Elevator', () {
    final flameTester = FlameTester<TestGame>(TestGame.new);

    flameTester.test('loads correctly', (game) async {
      final elevator = Elevator.test();

      await game.ready();
      await game.ensureAdd(elevator);

      expect(game.contains(elevator), isTrue);
    });

    flameTester.test('positioned correctly', (game) async {
      final elevator = Elevator.test(center: Vector2.zero());

      await game.ready();
      await game.ensureAdd(elevator);

      expect(elevator.position, closeToVector(Vector2(0, 0)));
    });
  });
}
