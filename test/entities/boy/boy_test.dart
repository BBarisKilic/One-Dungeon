// ignore_for_file: cascade_invocations

import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;

import '../../helpers/test_game.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await di.initializeDependencies();
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('Boy', () {
    final flameTester = FlameTester<TestGame>(TestGame.new);

    flameTester.test('loads correctly', (game) async {
      final chicken = Boy.wasd();

      await game.ready();
      await game.ensureAdd(chicken);

      expect(game.contains(chicken), isTrue);
    });

    flameTester.test('positioned correctly', (game) async {
      final chicken = Boy.arrows(center: Vector2.zero());

      await game.ready();
      await game.ensureAdd(chicken);

      expect(chicken.position, closeToVector(Vector2(0, 0)));
    });
  });
}
