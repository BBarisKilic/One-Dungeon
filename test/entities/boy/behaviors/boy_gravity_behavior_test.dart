// ignore_for_file: cascade_invocations

import 'package:flame/game.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;

import '../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BoyGravityBehavior boyGravityBehavior;

  setUp(() {
    boyGravityBehavior = BoyGravityBehavior();
  });

  setUpAll(() async {
    await di.initializeDependencies();
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('BoyGravityBehavior', () {
    final flameTester = FlameTester<TestGame>(TestGame.new);

    flameTester.test('gravity works as expected', (game) async {
      final centerY = game.size.y / 2;
      final boy = Boy.test(
        center: Vector2(0, centerY),
        behavior: boyGravityBehavior,
      );

      await game.ready();
      await game.ensureAdd(boy);

      boy.isBottomTouching = false;
      game.update(1);

      expect(boy.position.y, isNot(equals(centerY)));
    });
  });
}
