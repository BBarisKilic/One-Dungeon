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

  group('Boy', () {
    testWithGame<TestGame>(
      'loads correctly',
      TestGame.new,
      (game) async {
        final boy = Boy.wasd();

        await game.ready();
        await game.ensureAdd(boy);

        expect(game.contains(boy), isTrue);
      },
    );

    testWithGame<TestGame>(
      'positioned correctly',
      TestGame.new,
      (game) async {
        final boy = Boy.arrows(center: Vector2.zero());

        await game.ready();
        await game.ensureAdd(boy);

        expect(boy.position, closeToVector(Vector2(0, 0)));
      },
    );
  });
}
