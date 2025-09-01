import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../helpers/helpers.dart';

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

  setUpAll(() async {
    await injectDependencies();
    await getIt.unregister<OneDungeonAudioPlayer>();
    getIt.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await getIt.reset();
  });

  group('OneDungeonGame', () {
    test('can be instantiated', () {
      expect(OneDungeonGame(), isA<OneDungeonGame>());
    });

    group('components', () {
      testWithGame<TestGame>(
        'has only many Gates',
        TestGame.new,
        (game) async {
          await game.ready();

          expect(
            game.descendants().whereType<Gate>().length,
            greaterThanOrEqualTo(1),
          );
        },
      );

      testWithGame<TestGame>(
        'has only many Grounds',
        TestGame.new,
        (game) async {
          await game.ready();

          expect(
            game.descendants().whereType<Ground>().length,
            greaterThanOrEqualTo(1),
          );
        },
      );

      testWithGame<TestGame>(
        'has only many Traps',
        TestGame.new,
        (game) async {
          await game.ready();

          expect(
            game.descendants().whereType<Trap>().length,
            greaterThanOrEqualTo(1),
          );
        },
      );
    });

    group('entities', () {
      testWithGame<TestGame>(
        'has only one Boy',
        TestGame.new,
        (game) async {
          await game.ready();

          expect(
            game.world.children.whereType<Boy>().length,
            equals(1),
          );
        },
      );
    });

    group('behaviors', () {
      testWithGame<TestGame>(
        'Boy has KeyboardMovingBehavior',
        TestGame.new,
        (game) async {
          await game.ready();

          final boy = game.world.children.whereType<Boy>();

          expect(
            boy.first.hasBehavior<BoyMovingBehavior>(),
            isTrue,
          );
        },
      );
    });

    group('key events', () {
      testWithGame<TestGame>(
        'are handled',
        TestGame.new,
        (game) async {
          await game.ready();

          final event = _MockKeyEvent();
          final keysPressed = {LogicalKeyboardKey.pageDown};

          expect(
            game.onKeyEvent(event, keysPressed),
            KeyEventResult.handled,
          );
        },
      );

      testWithGame<TestGame>(
        'pressed up arrow',
        TestGame.new,
        (game) async {
          await game.ready();

          final keysPressed = {LogicalKeyboardKey.arrowUp};

          expect(
            keysPressed.contains(LogicalKeyboardKey.arrowUp),
            isTrue,
          );
        },
      );
    });
  });
}
