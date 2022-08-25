import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:one_dungeon/entities/entities.dart';

class GameTime extends Entity {
  GameTime({
    Vector2? center,
  }) : this._(
          center: center ?? Vector2(60, 600),
          textComponent: TextComponent(
            size: _gameTimeSize,
            textRenderer: TextPaint(
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'PressStart2P',
                fontSize: 22,
              ),
            ),
          ),
          behaviors: [TimeChangeBehavior()],
        );

  GameTime._({
    required Vector2 center,
    required this.textComponent,
    required Iterable<Behavior> behaviors,
  }) : super(
          size: _gameTimeSize,
          position: center,
          anchor: Anchor.center,
          behaviors: [
            ...behaviors,
          ],
          children: [textComponent],
        );

  final TextComponent textComponent;

  static final _gameTimeSize = Vector2(64, 48);
}
