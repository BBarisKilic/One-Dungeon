// ignore_for_file: cascade_invocations

import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

mixin _DiagnosticableToStringMixin on Object {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class _MockKeyEvent extends Mock
    with _DiagnosticableToStringMixin
    implements KeyEvent {}

void main() {
  TestWidgetsBinding.ensureInitialized();

  late KeyboardMovingBehavior keyboardMovingBehavior;

  setUp(() {
    keyboardMovingBehavior = KeyboardMovingBehavior(
      jumpKey: LogicalKeyboardKey.arrowUp,
      leftKey: LogicalKeyboardKey.arrowLeft,
      rightKey: LogicalKeyboardKey.arrowRight,
    );
  });

  setUpAll(() async {
    await di.initializeDependencies();
    await di.injector.unregister<OneDungeonAudioPlayer>();
    di.injector.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('KeyboardMovingBehavior', () {
    group('initial', () {
      test('keys are correct', () {
        expect(
          keyboardMovingBehavior.jumpKey,
          equals(LogicalKeyboardKey.arrowUp),
        );
        expect(
          keyboardMovingBehavior.leftKey,
          equals(LogicalKeyboardKey.arrowLeft),
        );
        expect(
          keyboardMovingBehavior.rightKey,
          equals(LogicalKeyboardKey.arrowRight),
        );
      });
    });

    testWithGame<TestGame>(
      'jumps as expected',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          behavior: keyboardMovingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        final event = _MockKeyEvent();
        final keysPressed = {LogicalKeyboardKey.arrowUp};

        expect(boy.velocity.y, equals(0));

        keyboardMovingBehavior.onKeyEvent(event, keysPressed);

        expect(boy.velocity.y, equals(-110));
      },
    );

    testWithGame<TestGame>(
      'moves right as expected',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          behavior: keyboardMovingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        final event = _MockKeyEvent();
        final keysPressed = {LogicalKeyboardKey.arrowRight};

        expect(boy.velocity.x, equals(0));

        keyboardMovingBehavior.onKeyEvent(event, keysPressed);

        expect(boy.velocity.x, equals(100));
      },
    );

    testWithGame<TestGame>(
      'moves left as expected',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          behavior: keyboardMovingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        final event = _MockKeyEvent();
        final keysPressed = {LogicalKeyboardKey.arrowLeft};

        expect(boy.velocity.x, equals(0));

        keyboardMovingBehavior.onKeyEvent(event, keysPressed);

        expect(boy.velocity.x, equals(-100));
      },
    );

    testWithGame<TestGame>(
      'flips as expected',
      TestGame.new,
      (game) async {
        final boy = Boy.test(
          behavior: keyboardMovingBehavior,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        final event = _MockKeyEvent();
        final leftKeysPressed = {LogicalKeyboardKey.arrowLeft};
        final rightKeysPressed = {LogicalKeyboardKey.arrowRight};

        keyboardMovingBehavior.onKeyEvent(event, leftKeysPressed);
        game.update(1);

        expect(boy.isFlipped, isTrue);

        keyboardMovingBehavior.onKeyEvent(event, rightKeysPressed);
        game.update(1);

        expect(boy.isFlipped, isFalse);
      },
    );

    testWithGame<TestGame>('motionless as expected', TestGame.new,
        (game) async {
      final center = Vector2(0, 0);
      final boy = Boy.test(
        behavior: keyboardMovingBehavior,
        center: center,
      );

      await game.ready();

      await game.world.ensureAdd(boy);

      final event = _MockKeyEvent();
      final keysPressed = <LogicalKeyboardKey>{};

      keyboardMovingBehavior.onKeyEvent(event, keysPressed);
      game.update(1);

      expect(boy.position, equals(Vector2.zero()));
    });

    testWithGame<TestGame>(
      'in the expected point at elevator',
      TestGame.new,
      (game) async {
        final center = Vector2(100, 100);
        final boy = Boy.test(
          behavior: keyboardMovingBehavior,
          center: center,
        );

        await game.ready();

        await game.world.ensureAdd(boy);

        final event = _MockKeyEvent();
        final keysPressed = {LogicalKeyboardKey.arrowUp};

        expect(boy.position.y, equals(100));

        boy.isUsingElevator = true;
        keyboardMovingBehavior.onKeyEvent(event, keysPressed);

        expect(boy.position.y, equals(95));
      },
    );

    testWithGame<TestGame>(
      'key events are handled',
      TestGame.new,
      (game) async {
        final event = _MockKeyEvent();
        final keysPressed = {LogicalKeyboardKey.pageDown};

        expect(game.onKeyEvent(event, keysPressed), KeyEventResult.handled);
      },
    );
  });
}
