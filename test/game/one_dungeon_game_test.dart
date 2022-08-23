// ignore_for_file: cascade_invocations

import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/components/components.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;

import '../helpers/helpers.dart';

mixin _DiagnosticableToStringMixin on Object {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class _RawKeyEvent extends Mock
    with _DiagnosticableToStringMixin
    implements RawKeyEvent {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await di.initializeDependencies();
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('OneDungeonGame', () {
    final flameTester = FlameTester<TestGame>(TestGame.new);

    test('can be instantiated', () {
      expect(OneDungeonGame(), isA<OneDungeonGame>());
    });

    group('components', () {
      flameTester.test('has only many Gates', (game) async {
        await game.ready();

        expect(
          game.descendants().whereType<Gate>().length,
          greaterThanOrEqualTo(1),
        );
      });

      flameTester.test('has only many Grounds', (game) async {
        await game.ready();

        expect(
          game.descendants().whereType<Ground>().length,
          greaterThanOrEqualTo(1),
        );
      });

      flameTester.test('has only many Traps', (game) async {
        await game.ready();

        expect(
          game.descendants().whereType<Trap>().length,
          greaterThanOrEqualTo(1),
        );
      });
    });

    group('entities', () {
      flameTester.test('has only one Boy', (game) async {
        await game.ready();

        expect(
          game.children.whereType<Boy>().length,
          equals(1),
        );
      });
    });

    group('behaviors', () {
      flameTester.test('Boy has KeyboardMovingBehavior', (game) async {
        await game.ready();

        final boy = game.children.whereType<Boy>();

        expect(
          boy.first.hasBehavior<KeyboardMovingBehavior>(),
          isTrue,
        );
      });
    });

    group('key events', () {
      flameTester.test('are handled', (game) async {
        await game.ready();

        final event = _RawKeyEvent();
        final keysPressed = {LogicalKeyboardKey.pageDown};

        expect(
          game.onKeyEvent(event, keysPressed),
          KeyEventResult.handled,
        );
      });

      flameTester.test('pressed up arrow', (game) async {
        await game.ready();

        final keysPressed = {LogicalKeyboardKey.arrowUp};

        expect(
          keysPressed.contains(LogicalKeyboardKey.arrowUp),
          isTrue,
        );
      });
    });
  });
}
