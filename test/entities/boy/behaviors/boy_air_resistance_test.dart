// ignore_for_file: cascade_invocations

import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;

import '../../../helpers/test_game.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BoyAirResistanceBehavior boyAirResistanceBehavior;

  setUp(() {
    boyAirResistanceBehavior = BoyAirResistanceBehavior();
  });

  setUpAll(() async {
    await di.initializeDependencies();
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('BoyAirResistanceBehavior', () {
    final flameTester = FlameTester<TestGame>(TestGame.new);

    flameTester.test(
        'applies resistance when having positive velocity in the x direction',
        (game) async {
      final boy = Boy.test(
        velocity: Vector2(10, 0),
        behavior: boyAirResistanceBehavior,
      );

      await game.ready();
      await game.ensureAdd(boy);

      expect(boy.velocity.x, equals(10));

      game.update(1);

      expect(boy.velocity.x, isNot(equals(10)));
    });

    flameTester.test(
        'applies resistance when having negative velocity in the x direction',
        (game) async {
      final boy = Boy.test(
        velocity: Vector2(-10, 0),
        behavior: boyAirResistanceBehavior,
      );

      await game.ready();
      await game.ensureAdd(boy);

      expect(boy.velocity.x, equals(-10));

      game.update(1);

      expect(boy.velocity.x, isNot(equals(-10)));
    });

    flameTester.test('stops character on left edge of the screen',
        (game) async {
      final boy = Boy.test(
        velocity: Vector2(-10, 0),
        center: Vector2(10, 0),
        behavior: boyAirResistanceBehavior,
      );

      await game.ready();
      await game.ensureAdd(boy);

      expect(boy.position.x, equals(10));

      game.update(1);

      expect(boy.position.x, equals(boy.size.x / 2));
    });

    flameTester.test('stops character on right edge of the screen',
        (game) async {
      final boy = Boy.test(
        velocity: Vector2(10, 0),
        center: Vector2(game.size[0], 0),
        behavior: boyAirResistanceBehavior,
      );

      await game.ready();
      await game.ensureAdd(boy);

      expect(boy.position.x, equals(game.size[0]));

      game.update(1);

      expect(boy.position.x, equals(game.size[0] - (boy.size.x / 2)));
    });
  });
}
